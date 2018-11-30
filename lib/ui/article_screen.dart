import 'package:flutter/material.dart';
import 'package:flutter_times/model/ny_times_model.dart';
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
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Center(
        child: _thumbnail(article),
      ),
    );
  }
}

Widget _thumbnail(NyTimesArticle article) {
  return Hero(
    tag: article.id,
    child: FadeInImage.memoryNetwork(
      width: 64.0,
      height: 64.0,
      placeholder: kTransparentImage,
      image: article.media?.first?.mediaMetadata
              ?.firstWhere((NyTimesMediaMetaData metadata) =>
                  metadata.format == 'square320')
              ?.url ??
          '',
    ),
  );
}
