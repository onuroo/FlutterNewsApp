import 'package:flutter/material.dart';
import '../stores/newsStore.dart';

class NewsList extends StatelessWidget {
  final String category;

  NewsList({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: category,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(16, 21, 28, 1),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Categories'),
            backgroundColor: Color.fromRGBO(16, 21, 28, 1),
          ),
          body: Center(
            child: FutureBuilder<PostsList>(
            future: fetchPostsList(category),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data.posts.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text(
                    "${snapshot.data.posts[index].author} -- ${snapshot.data.posts[index].description} \n\n\n",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  );
                },
              );
                },
              ),
            ),
          ),
      );
  }
}
