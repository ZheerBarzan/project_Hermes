import 'package:fluent_ui/fluent_ui.dart';
import 'package:project_hermes/model/article_catagory.dart';

class NewsPage {
  final String title;
  final IconData iconData;
  final ArticleCatagory articleCatagory;

  NewsPage(
      {required this.title,
      required this.iconData,
      required this.articleCatagory});
}
