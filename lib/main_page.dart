import 'package:flutter/material.dart';
import 'package:json/dota_heroes_json.dart';
import 'package:json/photo_json_page.dart';
import 'package:json/post_json_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: ListView(
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return PostJsonPage();
                }),
              );
            },
            child: Text('Post Json Parsing'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return PhotoJsonPage();
                }),
              );
            },
            child: Text('Photo Json Parsing'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DotaHeroesPage();
                }),
              );
            },
            child: Text('DotaHeroes Json Parsing'),
          ),
        ],
      ),
    );
  }
}
