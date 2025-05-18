import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/book_item.dart';

class FavoriteScreen extends StatefulWidget {
  static const screenRoute = '/favorite-screen';
  List<Book> favoriteBooks;
  FavoriteScreen(this.favoriteBooks, {super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteBooks.isEmpty) {
      return Center(
        child: Text(
          "You don't have any favorite books,yet!",
          style: TextStyle(fontSize: 17, color: Colors.black),
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: widget.favoriteBooks.length,
        itemBuilder: (BuildContext context, int index) {
          return BookItem(
            id: widget.favoriteBooks[index].id,
            title: widget.favoriteBooks[index].title,
            imageUrl: widget.favoriteBooks[index].imageUrl,
            pageNumbers: widget.favoriteBooks[index].pageNumbers,
            author: widget.favoriteBooks[index].author,
          );
        },
      );
    }
  }
}
