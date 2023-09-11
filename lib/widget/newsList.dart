import 'package:fluent_ui/fluent_ui.dart';
import 'package:project_hermes/model/article.dart';
import 'package:project_hermes/model/news_page.dart';
import 'package:project_hermes/services/news_api.dart';
import 'package:project_hermes/widget/newsItem.dart';

class NewsListPage extends StatefulWidget {
  final NewsPage newsPage;
  final NewsApi newsApi = const NewsApi();
  const NewsListPage({super.key, required this.newsPage});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles =
        widget.newsApi.fetchArticles(widget.newsPage.articleCatagory);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(title: Text(widget.newsPage.title)),
      content: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 270,
                  mainAxisExtent: 290,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              padding: const EdgeInsets.all(25),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return NewsItem(
                  article: snapshot.data![index],
                );
              },
            );
          } else if (snapshot.hasError) {
            Typography typography = FluentTheme.of(context).typography;
            return Column(
              children: [
                const Spacer(),
                Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: typography.bodyStrong,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FilledButton(
                    child: const Text("Refresh"),
                    onPressed: () {
                      setState(() {
                        futureArticles = widget.newsApi
                            .fetchArticles(widget.newsPage.articleCatagory);
                      });
                    }),
                const Spacer(),
              ],
            );
          }
          return const SizedBox(
            height: 30,
            width: 30,
            child: ProgressBar(),
          );
        },
      ),
    );
  }
}
