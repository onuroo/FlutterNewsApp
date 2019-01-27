import 'package:flutter/material.dart';
import './components/categoryList.dart';
import './views/newsList.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(16, 21, 28, 1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Categories'),
          backgroundColor: Color.fromRGBO(16, 21, 28, 1),
        ),
        body: CategoryList(
          onPressedItem: (category) {
            print("onPressedItem");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsList( category: category )),
            );
          },
        ),
      )
    );
  }
}