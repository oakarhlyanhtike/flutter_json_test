import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotoJsonPage extends StatefulWidget {
  const PhotoJsonPage({Key? key}) : super(key: key);

  @override
  _PhotoJsonPageState createState() => _PhotoJsonPageState();
}

class _PhotoJsonPageState extends State<PhotoJsonPage> {
  var urlPhoto = Uri.parse('https://jsonplaceholder.typicode.com/photos');

  getData() async {
    await http.get(urlPhoto).then((response) {
      List<dynamic> list1 = json.decode(response.body);

      List<Map<String, dynamic>> list2 = [];
      list1.forEach((listData) {
        Map<String, dynamic> map = {
          'title': listData['title'],
          'url': listData['url'],
          
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
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Json Page'),
      ),
      body: list.length ==0?  Center(
        child: CircularProgressIndicator(),
      ):   ListView(
        children: list.map((listData) {
          return Card(
            child: Column(children: [
              Image.network(listData['url']),
              Text(listData['title'])
            ],),
          );
        }).toList(),
      ),
    );
  }
}
