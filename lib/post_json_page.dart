import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostJsonPage extends StatefulWidget {
  const PostJsonPage({Key? key}) : super(key: key);

  @override
  _PostJsonPageState createState() => _PostJsonPageState();
}

class _PostJsonPageState extends State<PostJsonPage> {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  getData() async {
    await http.get(url).then((response) {
      //
      // print(response.statusCode);
      // print(response.body);

      List<dynamic> list1 = json.decode(response.body);

      List<Map<String, dynamic>> list2 = [];

      list1.forEach((listData) {
        Map<String, dynamic> map = {
          'userId': listData['userId'],
          'id': listData['id'],
          'title': listData['title'],
          'body': listData['body']
        };
        list2.add(map);
      });
      print(list2.length.toString() + 'list2');
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
        title: Text('Post Json Page'),
      ),
      body: list.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: list.map((listData) {
                return Card(
                  child: ListTile(
                    leading: Text(listData['userId'].toString()),
                    title: Text(listData['title']),
                    subtitle: Text(listData['body']),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
