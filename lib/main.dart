import 'package:flutter/material.dart';
import 'package:flutterdemo/home/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first',
      home: Index(),
    );
  }
}
