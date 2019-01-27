import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post{
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Post({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Post.fromJson(Map<String, dynamic> json){
    return new Post(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

Future<PostsList> fetchPostsList(category) async {
  var url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=863566d7e61f45178d80ca9ea58f3486';
  final response =
    await http.get(url);

    if (response.statusCode == 200) {
      return PostsList.fromJson(json.decode(response.body)["articles"]);
    } else {
      throw Exception('Failed to load post');
    }
  }

  class PostsList {
    final List<Post> posts;
    PostsList({
      this.posts,
    });

    factory PostsList.fromJson(List<dynamic> parsedJson) {

    List<Post> posts = new List<Post>();
    posts = parsedJson.map((i)=>Post.fromJson(i)).toList();

    return new PostsList(
      posts: posts
    );
  }
}