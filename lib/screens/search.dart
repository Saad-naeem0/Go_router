import 'package:flutter/material.dart';
import 'home.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        shadowColor: Colors.grey,
        child: ListTile(
          title: Text(fact.text),
          subtitle: Text(length.text),
        ),
      ),
    );
  }
}
