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
  Cat _randomCat;

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
            setState(() => _randomCat = null);
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
      _randomCat = newCat;
    });
  }

  Widget _buildCatImage() {
    if (_randomCat != null) {
      return Expanded(
        child: Image.network(
          _randomCat.url,
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
