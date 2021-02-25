import 'package:expandable_listview_example/data/basic_tiles.dart';
import 'package:expandable_listview_example/main.dart';
import 'package:expandable_listview_example/model/basic_tile.dart';
import 'package:expandable_listview_example/utils.dart';
import 'package:flutter/material.dart';

class BasicTilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: ListView(
          children:
              basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
}

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    Key key,
    @required this.tile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.tiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title),
        onTap: () => Utils.showSnackBar(
          context,
          text: 'Clicked on: $title',
          color: Colors.green,
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}
