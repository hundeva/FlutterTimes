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
    return ListTile(
      title: Text(article.title),
      onTap: () {},
    );
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
    return ListTile(
      leading: _thumbnail(article),
      title: Text(article.title),
      subtitle: Text(article.byline),
      onTap: () {},
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
      child: ListTile(
        leading: _thumbnail(article),
        title: Text(article.title),
        subtitle: Text(article.byline),
        onTap: () {},
      ),
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
