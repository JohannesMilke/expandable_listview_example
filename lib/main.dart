import 'package:expandable_listview_example/page/advanced_tile_page.dart';
import 'package:expandable_listview_example/page/basic_tile_page.dart';
import 'package:expandable_listview_example/page/text_tile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Expansion Tile';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          title: Text('Text'),
        ),
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          title: Text('Basic'),
        ),
        BottomNavigationBarItem(
          icon: Text('ExpansionTile', style: style),
          title: Text('Advanced'),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return TextTilePage();
      case 1:
        return BasicTilePage();
      case 2:
        return AdvancedTilePage();
      default:
        return Container();
    }
  }
}
