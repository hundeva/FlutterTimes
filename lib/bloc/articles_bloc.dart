import 'package:bloc/bloc.dart';
import 'package:flutter_times/model/ny_times_model.dart';
import 'package:flutter_times/net/ny_times_api.dart';
import 'package:flutter_times/store/articles_store.dart';

const int _offset = 20;

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesStore _store = const ArticlesStore();
  final NyTimesApi _api = NyTimesApi();

  int _page = 0;

  @override
  ArticlesState get initialState => ArticlesState.initial();

  @override
  Stream<ArticlesState> mapEventToState(
    ArticlesState state,
    ArticlesEvent event,
  ) async* {
    if (event is LoadDefaultArticles) {
      _page = 0;
      NyTimesArticles storedArticles = await _store.getDefaultArticles();
      if (storedArticles != null) {
        yield ArticlesState.fromArticles(storedArticles);
      }

      NyTimesArticles apiArticles = await _api.getMostPopularArticles();
      _store.setDefaultArticles(apiArticles);
      yield ArticlesState.fromArticles(apiArticles);
    } else if (event is LoadNextPageArticles) {
      int offset = _page * _offset;
      NyTimesArticles apiArticles =
          await _api.getMostPopularArticles(offset: offset).then((articles) {
        _page++;
      });
      yield state.copyWithNewPage(apiArticles);
    }
  }
}

class ArticlesState {
  final List<NyTimesArticle> articles;

  ArticlesState(this.articles);

  factory ArticlesState.initial() => ArticlesState(null);

  factory ArticlesState.fromArticles(NyTimesArticles articles) {
    return ArticlesState(articles.articles);
  }

  ArticlesState copyWithNewPage(NyTimesArticles newPage) {
    return ArticlesState(this.articles..addAll(newPage.articles));
  }
}

abstract class ArticlesEvent {}

class LoadDefaultArticles extends ArticlesEvent {}

class LoadNextPageArticles extends ArticlesEvent {}
