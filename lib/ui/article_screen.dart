import 'package:flutter/material.dart';
import 'package:flutter_times/app/strings.dart';
import 'package:flutter_times/model/ny_times_model.dart';
import 'package:flutter_times/ui/webview_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ArticleScreen extends StatelessWidget {
  final NyTimesArticle article;

  const ArticleScreen({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
      bottomNavigationBar: _bottomAppBar(context),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.of(context).articleDetails),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: _thumbnail(article),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  article.title,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  article.abstract,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Text(
                  article.byline ?? '',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: MaterialButton(
        child: Text(AppStrings.of(context).openArticle),
        onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WebViewScreen(url: article.url),
              ),
            ),
      ),
    );
  }
}

Widget _thumbnail(NyTimesArticle article) {
  return Hero(
    tag: article.id,
    child: FadeInImage.memoryNetwork(
      width: 96.0,
      height: 96.0,
      placeholder: kTransparentImage,
      image: article.media?.first?.mediaMetadata
              ?.firstWhere((NyTimesMediaMetaData metadata) =>
                  metadata.format == 'square320')
              ?.url ??
          '',
    ),
  );
}
