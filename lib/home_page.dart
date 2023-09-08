import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  int index = 0;
  final key = GlobalKey();

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
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.news),
            title: const Text('Top headlines'),
            body: const Text("Top Headlines"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.hot),
            title: const Text('Top headlines'),
            body: const Text("Top Headlines"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.more_sports),
            title: const Text('Top headlines'),
            body: const Text("Top Headlines"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Top headlines'),
            body: const Text("Top Headlines"),
          ),
        ],
        selected: index,
        onChanged: (value) {
          setState(() {
            index = value;
          });
          PaneDisplayMode.compact;
        },
      ),
      content: null,
    );
  }
}
