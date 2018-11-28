import 'package:flutter/material.dart';
import 'package:flutter_times/model/ny_times_model.dart';

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
    return Text(article.title);
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
      child: Text(article.title),
    );
  }
}
