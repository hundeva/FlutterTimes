import 'package:flutter/material.dart';
import 'package:flutter_times/model/ny_times_model.dart';
import 'package:transparent_image/transparent_image.dart';

class CompactArticleItem extends StatelessWidget {
  final NyTimesArticle article;

  const CompactArticleItem({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(article.title);
  }
}

class ListArticleItem extends StatelessWidget {
  final NyTimesArticle article;

  const ListArticleItem({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        _thumbnail(article),
        Container(width: 16.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(article.title),
              Container(height: 8.0),
              Text(article.byline),
            ],
          ),
        ),
      ],
    );
  }
}

class CardArticleItem extends StatelessWidget {
  final NyTimesArticle article;

  const CardArticleItem({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListArticleItem(article: article),
    );
  }
}

Widget _thumbnail(NyTimesArticle article) {
  return FadeInImage.memoryNetwork(
    width: 64.0,
    height: 64.0,
    placeholder: kTransparentImage,
    image: article.media?.first?.mediaMetadata
            ?.firstWhere((NyTimesMediaMetaData metadata) =>
                metadata.format == 'square320')
            ?.url ??
        '',
  );
}
