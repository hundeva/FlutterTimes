import 'dart:convert';

import 'package:flutter_times/model/ny_times_model.dart';
import 'package:flutter_times/store/database.dart';

const String _articles = 'articles';

class ArticlesStore {
  const ArticlesStore();

  Future<NyTimesArticles> getDefaultArticles() async {
    String json = await preferences.get(_articles);
    return json == null ? null : NyTimesArticles.fromJson(jsonDecode(json));
  }

  Future setDefaultArticles(NyTimesArticles articles) async {
    String json = jsonEncode(articles.toJson());
    return preferences.put(json, _articles);
  }
}
