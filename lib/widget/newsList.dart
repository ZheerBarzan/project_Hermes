import 'package:fluent_ui/fluent_ui.dart';
import 'package:project_hermes/model/news_page.dart';
import 'package:project_hermes/widget/newsItem.dart';

class NewsListPage extends StatefulWidget {
  final NewsPage newsPage;
  const NewsListPage({super.key, required this.newsPage});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(title: Text(widget.newsPage.title)),
      content: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 270,
              mainAxisExtent: 290,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          padding: EdgeInsets.all(25),
          itemBuilder: (context, index) {
            return NewsItem();
          }),
    );
  }
}
