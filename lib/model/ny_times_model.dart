import 'package:json_annotation/json_annotation.dart';

part 'ny_times_model.g.dart';

@JsonSerializable()
class NyTimesArticle {
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'adx_keywords')
  final String adxKeywords;
  @JsonKey(name: 'column')
  final String column;
  @JsonKey(name: 'section')
  final String section;
  @JsonKey(name: 'byline')
  final String byline;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'abstract')
  final String abstract;
  @JsonKey(name: 'published_date')
  final String publishedDate;
  @JsonKey(name: 'source')
  final String source;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'asset_id')
  final int assetId;
  @JsonKey(name: 'views')
  final int views;
  @JsonKey(name: 'media')
  final List<NyTimesMedia> media;

  NyTimesArticle({
    this.url,
    this.adxKeywords,
    this.column,
    this.section,
    this.byline,
    this.type,
    this.title,
    this.abstract,
    this.publishedDate,
    this.source,
    this.id,
    this.assetId,
    this.views,
    this.media,
  });

  factory NyTimesArticle.fromJson(Map map) => _$NyTimesArticleFromJson(map);

  Map toJson() => _$NyTimesArticleToJson(this);
}

@JsonSerializable()
class NyTimesArticles {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'copyright')
  final String copyright;
  @JsonKey(name: 'num_results')
  final int numResults;
  @JsonKey(name: 'results')
  final List<NyTimesArticle> articles;

  NyTimesArticles({
    this.status,
    this.copyright,
    this.numResults,
    this.articles,
  });

  factory NyTimesArticles.fromJson(Map map) => _$NyTimesArticlesFromJson(map);

  Map toJson() => _$NyTimesArticlesToJson(this);
}

@JsonSerializable()
class NyTimesMedia {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'subtype')
  final String subtype;
  @JsonKey(name: 'caption')
  final String caption;
  @JsonKey(name: 'copyright')
  final String copyright;
  @JsonKey(name: 'approved_for_syndication')
  final int approvedForSyndication;
  @JsonKey(name: 'media-metadata')
  final List<NyTimesMediaMetaData> mediaMetadata;

  NyTimesMedia({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  factory NyTimesMedia.fromJson(Map map) => _$NyTimesMediaFromJson(map);

  Map toJson() => _$NyTimesMediaToJson(this);
}

@JsonSerializable()
class NyTimesMediaMetaData {
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'format')
  final String format;
  @JsonKey(name: 'height')
  final int height;
  @JsonKey(name: 'width')
  final int width;

  NyTimesMediaMetaData({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory NyTimesMediaMetaData.fromJson(Map map) =>
      _$NyTimesMediaMetaDataFromJson(map);

  Map toJson() => _$NyTimesMediaMetaDataToJson(this);
}
