// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ny_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NyTimesArticle _$NyTimesArticleFromJson(Map<String, dynamic> json) {
  return NyTimesArticle(
      url: json['url'] as String,
      adxKeywords: json['adx_keywords'] as String,
      column: json['column'] as String,
      section: json['section'] as String,
      byline: json['byline'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      abstract: json['abstract'] as String,
      publishedDate: json['published_date'] as String,
      source: json['source'] as String,
      id: json['id'] as int,
      assetId: json['asset_id'] as int,
      views: json['views'] as int,
      media: (json['media'] as List)
          ?.map((e) => e == null ? null : NyTimesMedia.fromJson(e as Map))
          ?.toList());
}

Map<String, dynamic> _$NyTimesArticleToJson(NyTimesArticle instance) =>
    <String, dynamic>{
      'url': instance.url,
      'adx_keywords': instance.adxKeywords,
      'column': instance.column,
      'section': instance.section,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'abstract': instance.abstract,
      'published_date': instance.publishedDate,
      'source': instance.source,
      'id': instance.id,
      'asset_id': instance.assetId,
      'views': instance.views,
      'media': instance.media
    };

NyTimesArticles _$NyTimesArticlesFromJson(Map<String, dynamic> json) {
  return NyTimesArticles(
      status: json['status'] as String,
      copyright: json['copyright'] as String,
      numResults: json['num_results'] as int,
      articles: (json['results'] as List)
          ?.map((e) => e == null ? null : NyTimesArticle.fromJson(e as Map))
          ?.toList());
}

Map<String, dynamic> _$NyTimesArticlesToJson(NyTimesArticles instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.articles
    };

NyTimesMedia _$NyTimesMediaFromJson(Map<String, dynamic> json) {
  return NyTimesMedia(
      type: json['type'] as String,
      subtype: json['subtype'] as String,
      caption: json['caption'] as String,
      copyright: json['copyright'] as String,
      approvedForSyndication: json['approved_for_syndication'] as int,
      mediaMetadata: (json['media-metadata'] as List)
          ?.map(
              (e) => e == null ? null : NyTimesMediaMetaData.fromJson(e as Map))
          ?.toList());
}

Map<String, dynamic> _$NyTimesMediaToJson(NyTimesMedia instance) =>
    <String, dynamic>{
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright,
      'approved_for_syndication': instance.approvedForSyndication,
      'media-metadata': instance.mediaMetadata
    };

NyTimesMediaMetaData _$NyTimesMediaMetaDataFromJson(Map<String, dynamic> json) {
  return NyTimesMediaMetaData(
      url: json['url'] as String,
      format: json['format'] as String,
      height: json['height'] as int,
      width: json['width'] as int);
}

Map<String, dynamic> _$NyTimesMediaMetaDataToJson(
        NyTimesMediaMetaData instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width
    };
