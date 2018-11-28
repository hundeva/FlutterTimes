import 'package:dio/dio.dart';
import 'package:flutter_times/model/ny_times_model.dart';

const String _apiKey = 'api-key';
const String _apiKeyValue = '8d4a66473b2e4ef2925e514592ac5e46';
const String _baseUrl = 'https://api.nytimes.com/svc/';
const String _mostPopular = 'mostpopular/v2/mostviewed/';
const String _offset = 'offset';

class NyTimesApi {
  final Dio _dio = Dio(
    Options(
      baseUrl: _baseUrl,
    ),
  );

  Future<NyTimesArticles> getMostPopularArticles({
    String section = 'all-sections',
    String period = '7',
    int offset = 0,
  }) async {
    Response response = await _dio.get('$_mostPopular/$section/$period', data: {
      _offset: offset,
      _apiKey: _apiKeyValue,
    });
    return NyTimesArticles.fromJson(response.data);
  }
}
