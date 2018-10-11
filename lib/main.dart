import 'dart:async';
import 'package:flutter/material.dart';

import './api/cat_api.dart';
import './pages/home.dart';
import './models/cat.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _catApi = CatApi();
  Cat _cat;

  @override
  void initState() {
    super.initState();
    _loadRandomCat();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'CatPix',
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.cyan,
      ),
      home: HomePage(_cat, _loadRandomCat),
    );
  }

  void _loadRandomCat() async {
    setState(() => _cat = null);
    // delay by 500ms to allow time for circular progress indicator
    final Cat newCat = await Future.delayed(Duration(milliseconds: 500), _catApi.fetchRandomCat);
    setState(() => _cat = newCat);
  }
}
