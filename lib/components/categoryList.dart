import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({@required this.onPressedItem});
  final Function onPressedItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
        CategoryItem(category: categoryList[index], onPress: onPressedItem),
        itemCount: categoryList.length,
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({@required this.category, @required this.onPress});

  final Function onPress;
  final Category category;
  
  Widget _buildTiles(Category root) {
    
    return new GestureDetector(
      onTap: () {
        onPress(root.key);
        print(root.key);
      },
      child: new Container(
        color: root.color,
        height: 50,
        margin: EdgeInsets.all(20.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              root.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(category);
  }
}

class Category {
  Category(this.title, this.key, this.color, [this.children = const <Category>[]]);
  final String title;
  final String key;
  final Color color;
  final List<Category> children;
}

final List<Category> categoryList = <Category>[
  new Category(
    'Flutter',
    'flutter',
    new Color.fromRGBO(255, 255, 255, 1),
  ),
  new Category(
    'React Native',
    'reactnative',
    new Color.fromRGBO(255, 255, 255, 1),
  ),
  new Category(
    'Football',
    'football',
    new Color.fromRGBO(255, 255, 255, 1),
  ),
  new Category(
    'Basketball',
    'basketball',
    new Color.fromRGBO(255, 255, 255, 1),
  ),
];