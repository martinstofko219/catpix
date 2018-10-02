import 'package:flutter/material.dart';

import './api/cat_api.dart';
import './models/cat.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _catApi = new CatApi();
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
        primarySwatch: Colors.red,
        accentColor: Colors.cyan,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CatPix'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() => _cat = null);
            _loadRandomCat();
          },
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCatImage(),
          ],
        ),
      ),
    );
  }

  void _loadRandomCat() async {
    final Cat newCat = await _catApi.fetchRandomCat();
    setState(() {
      _cat = newCat;
    });
  }

  Widget _buildCatImage() {
    if (_cat != null) {
      return Expanded(
        child: Image.network(
          _cat.url,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
