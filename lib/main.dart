import 'package:fluent_ui/fluent_ui.dart';
import 'package:project_hermes/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // add google fonts add icon change color
    await windowManager.setTitle("Hermes News");
    await windowManager.setTitleBarStyle(TitleBarStyle.normal);
    await windowManager.setBackgroundColor(Colors.black);
    await windowManager.setSize(const Size(755, 545));
    await windowManager.setMinimumSize(const Size(755, 545));
    await windowManager.center();
    await windowManager.show();
    await windowManager.setIcon("lib/images/hermes.png");
    await windowManager.setSkipTaskbar(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "HERMES NEWS",
      theme: FluentThemeData(
          brightness: Brightness.light,
          acrylicBackgroundColor: Colors.white,
          accentColor: Colors.red),
      darkTheme: FluentThemeData(
          brightness: Brightness.dark,
          acrylicBackgroundColor: Colors.black,
          accentColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
