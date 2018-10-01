import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CatPix',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.tealAccent,
      ),
      home: Scaffold(
        body: Center(
          child: Text('CatPix App'),
        ),
      ),
    );
  }
}
