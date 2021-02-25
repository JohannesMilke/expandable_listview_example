import 'package:expandable_listview_example/main.dart';
import 'package:expandable_listview_example/utils.dart';
import 'package:flutter/material.dart';

class TextTilePage extends StatefulWidget {
  @override
  _TextTilePageState createState() => _TextTilePageState();
}

class _TextTilePageState extends State<TextTilePage> {
  static final double radius = 20;

  UniqueKey keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => isExpanded ? shrinkTile() : expandTile(),
                      child: buildImage(),
                    ),
                    buildText(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildImage() => Image.network(
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 400,
      );

  Widget buildText(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            '👩 Sarah Pepperstone',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          children: [
            Text(
              'My name is Sarah and I am a New York City based Flutter developer. I help entrepreneurs & businesses figure out how to build scalable applications.\n\nWith over 7 years experience spanning across many industries from B2B to B2C, I live and breath Flutter.',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
          ],
          onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
          ),
        ),
      );
}
