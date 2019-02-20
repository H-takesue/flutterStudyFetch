import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'MainFetchData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: CupertinoPageScaffold(
          navigationBar: new CupertinoNavigationBar(
            middle: Text('テスト一覧'),
          ),
          child: new MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainFetchData(),
    );
  }
}
