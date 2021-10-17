import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DotaHeroesPage extends StatefulWidget {
  const DotaHeroesPage({Key? key}) : super(key: key);

  @override
  _DotaHeroesPageState createState() => _DotaHeroesPageState();
}

class _DotaHeroesPageState extends State<DotaHeroesPage> {
  var url = Uri.parse(
      'https://raw.githubusercontent.com/joshuaduffy/dota2api/master/dota2api/ref/heroes.json');

  getData() async {
    await http.get(url).then((response) {
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> list1 = map['heroes'];
      List<Map<String, dynamic>> list2 = [];
      list1.forEach((listData) {
        Map<String, dynamic> map = {
          'lName': listData['localized_name'],
          'full': listData['url_full_portrait'],
          'vertical': listData['url_vertical_portrait']
        };
        list2.add(map);
      });
      setState(() {
        list = list2;
      });
    });
  }

  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dota Heroes Json Page'),
      ),
      body: list.length==0? Center(
        child: CircularProgressIndicator(),
      ) :ListView(
        children: list.map((e) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Column(children: [
                Text(e['lName'],style: TextStyle(fontSize: 20,color: Colors.blue),),
                Image.network(e['full']),
                //Image.network(e['vertical'])
              ],),
            ),
          );
        }).toList(),
      ),
    );
  }
}
