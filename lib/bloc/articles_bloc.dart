import 'package:bloc/bloc.dart';
import 'package:flutter_times/model/ny_times_model.dart';
import 'package:flutter_times/net/ny_times_api.dart';
import 'package:flutter_times/store/articles_store.dart';

const int _offset = 20;

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final ArticlesStore _store = const ArticlesStore();
  final NyTimesApi _api = NyTimesApi();

  int _page = 0;
  bool _isLoading = false;

  @override
  void dispatch(ArticlesEvent event) {
    // TODO for now, drop the events when loading is in progress, figure something better out
    if (!_isLoading) {
      super.dispatch(event);
    }
  }

  @override
  ArticlesState get initialState => ArticlesState.initial();

  @override
  Stream<ArticlesState> mapEventToState(
    ArticlesState state,
    ArticlesEvent event,
  ) async* {
    _isLoading = true;
    if (event is LoadDefaultArticles) {
      _page = 0;
      NyTimesArticles storedArticles = await _store.getDefaultArticles();
      if (storedArticles != null) {
        yield ArticlesState.fromArticles(storedArticles);
      }

      try {
        NyTimesArticles apiArticles = await _api.getMostPopularArticles();
        _page++;
        _store.setDefaultArticles(apiArticles);
        yield ArticlesState.fromArticles(apiArticles);
      } catch (e) {
        print('Error reading API: $e');
      }
    } else if (event is LoadNextPageArticles) {
      int offset = _page * _offset;
      try {
        NyTimesArticles apiArticles =
            await _api.getMostPopularArticles(offset: offset);
        _page++;
        yield state.copyWithNewPage(apiArticles);
      } catch (e) {
        print('Error reading API: $e');
      }
    }
    _isLoading = false;
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
