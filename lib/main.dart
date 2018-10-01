// import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _catApiUrl =
      'https://api.thecatapi.com/v1/images/search?format=src&size=full';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CatPix',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.tealAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CatPix'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Image.network(
                _catApiUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
