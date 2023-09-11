import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:project_hermes/model/article.dart';
import 'package:project_hermes/model/article_catagory.dart';

class NewsApi {
  const NewsApi();

  static const baseUrl = "https://newsapi.org/v2";
  static const apiKey = "c212bebdac9741d3870383d4ca2d4e1f";

  Future<List<Article>> fetchArticles(ArticleCatagory catagory) async {
    var url = NewsApi.baseUrl;

    url += "/top-headlines";
    url += "?apiKey=$apiKey";
    url += "&language=en";
    url += "&catagory=${queryParams(catagory)}";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == "ok") {
        final dynamic articleJSON = json['articles'] ?? [];
        final List<Article> articles = articleJSON.map<Article>((e) {
          return Article.fromJson(e);
        }).toList();
        return articles;
      } else {
        throw Exception(json['messege'] ?? 'Failed to load ');
      }
    } else {
      throw Exception("bad respose");
    }
  }

  String queryParams(ArticleCatagory catagory) {
    switch (catagory) {
      case ArticleCatagory.general:
        return "general";
      case ArticleCatagory.business:
        return "business";
      case ArticleCatagory.technology:
        return "technology";
      case ArticleCatagory.entertainment:
        return "entertainment";
      case ArticleCatagory.sports:
        return "sports";
      case ArticleCatagory.science:
        return "science";
      case ArticleCatagory.health:
        return "health";

      default:
        return "general";
    }
  }
}
