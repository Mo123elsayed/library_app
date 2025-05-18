import 'package:flutter/material.dart';
import 'package:library_app/app_data.dart';
import 'package:library_app/widgets/book_item.dart';
import 'dart:ui';

class CategoryBooksScreen extends StatelessWidget {
  static const routeName = '/category-books-screen';

  const CategoryBooksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    // final backgroundImage = routeArgs['imageUrl'];
    final filteredBooks =
        books_data.where((book) {
          return book.categories.contains(categoryId);
        }).toList(); // Replace with your logic to filter books by categoryId

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFD4A373), size: 25),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          '$categoryTitle',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Color(0xFF4A3F35),
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   backgroundImage!,
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          // ClipRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          //     child: Container(color: Colors.transparent),
          //   ),
          // ),
          ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: filteredBooks.length,
            itemBuilder: (BuildContext context, int index) {
              return BookItem(
                id: filteredBooks[index].id,
                title: filteredBooks[index].title,
                imageUrl: filteredBooks[index].imageUrl,
                pageNumbers: filteredBooks[index].pageNumbers,
                author: filteredBooks[index].author,
              );
            },
          ),
        ],
      ),
    );
  }
}
