import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/getData.dart';

class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {
  List list = List();
  var isLoading = false;

  _fetchData() async {
    print('fetchStart!');
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://jsonplaceholder.typicode.com/photos");
    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      list = parsed.map<GetData>((json) => GetData.fromJson(json)).toList();

      setState(() {
        isLoading = false;
      });
      print(list[0]);
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState");
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {

                  return ListTile(
                    contentPadding: EdgeInsets.all(10.0),
                    title: Text(list[index].title),
                    trailing: Image.network(
                      list[index].thumbnailUrl,
                      fit: BoxFit.cover,
                      height: 40.0,
                      width: 40.0,
                    ),
                  );
                }));
  }
}
