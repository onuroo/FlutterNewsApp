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
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data.posts.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return NewsItem(data: snapshot.data.posts[index]);
                },
              );
                },
              ),
            ),
          ),
      );
  }
}


class NewsItem extends StatelessWidget {
  final data;

  NewsItem({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.all(20.0),
      height: 250,
      width: 50,
      child: Row(
        children: 
          <Widget>[
            //  IMAGE VIEW
            Expanded(
              child: Container(
                decoration: new BoxDecoration(
                ),
                alignment: Alignment.center,
                child: new Container(
                  padding: EdgeInsets.only(bottom: 70),
                  child: Image.network(
                    data.urlToImage,
                    width: 250,
                    height: 250,
                  ),
                ),
              ) ,
              flex: 4,
            ),
            //  IMAGE VIEW
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Expanded (
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            data.author != null ? data.author : '-',
                            maxLines: 2,
                          ),
                        ),
                     ),
                     flex: 1,
                    ),
                    Expanded (
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            data.title != null ? data.title : '-',
                            maxLines: 2,
                          ),
                        ),
                     ),
                     flex: 1,
                    ),
                    Expanded (
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            data.description != null ? data.description : '-',
                            maxLines: 5,
                          ),
                        ),
                     ),
                     flex: 4,
                    ),
                  ],

                ),
              ),
              flex: 9,
            ),
          ],
      ),
    );
  }

}