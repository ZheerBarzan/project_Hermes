import 'package:fluent_ui/fluent_ui.dart';
import 'package:project_hermes/model/article.dart';
import 'package:project_hermes/model/article_catagory.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  int index = 0;
  final key = GlobalKey();

  List<NewsPage> pages = [
    NewsPage(
        title: "General",
        iconData: FluentIcons.news,
        articleCatagory: ArticleCatagory.general),
    NewsPage(
        title: "Business",
        iconData: FluentIcons.money,
        articleCatagory: ArticleCatagory.business),
    NewsPage(
        title: "Technology",
        iconData: FluentIcons.laptop_selected,
        articleCatagory: ArticleCatagory.technology),
    NewsPage(
        title: "ET",
        iconData: FluentIcons.my_movies_t_v,
        articleCatagory: ArticleCatagory.entertainment),
    NewsPage(
        title: "Sports",
        iconData: FluentIcons.soccer,
        articleCatagory: ArticleCatagory.sports),
    NewsPage(
        title: "Science",
        iconData: FluentIcons.test_user_solid,
        articleCatagory: ArticleCatagory.science),
    NewsPage(
        title: "Health",
        iconData: FluentIcons.health,
        articleCatagory: ArticleCatagory.health),
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      key: key,
      pane: NavigationPane(
        selected: index,
        items: pages
            .map<NavigationPaneItem>((e) => PaneItem(
                icon: Icon(e.iconData),
                title: Text(e.title),
                body: Text(pages[index].title)))
            .toList(),
        onChanged: (value) {
          setState(() {
            index = value;
          });
          PaneDisplayMode.compact;
        },
      ),
    );
  }
}
