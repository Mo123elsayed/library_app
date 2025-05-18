import 'package:flutter/material.dart';
import 'package:library_app/screens/category_books_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.id,
  });
  @override
  @override
  Widget build(BuildContext context) {
    void selectedCategory(BuildContext ctx) {
      Navigator.of(context).pushNamed(
        CategoryBooksScreen.routeName,
        arguments: {'id': id, 'title': title, 'imageUrl': imageUrl},
      );
    }

    return InkWell(
      onTap: () => selectedCategory(context),
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            height: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
