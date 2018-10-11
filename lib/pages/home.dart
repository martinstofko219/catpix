import 'package:flutter/material.dart';

import '../models/cat.dart';

class HomePage extends StatelessWidget {
  final Cat cat;
  final Function onReloadCat;

  const HomePage(this.cat, this.onReloadCat);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CatPix'),
      ),
      backgroundColor: Theme.of(context).primaryColorLight,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          onReloadCat();
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildCatImage(),
        ],
      ),
    );
  }

  Widget _buildCatImage() {
    if (cat != null) {
      return Expanded(
        child: Image.network(
          cat.url,
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
