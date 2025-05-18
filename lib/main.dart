import 'package:flutter/material.dart';
import 'package:library_app/app_data.dart';
import 'package:library_app/screens/intro_screen.dart';
import '../models/book.dart';
import '../screens/book_details_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/pdf_screen.dart';
import '../screens/tabs_screen.dart';
import './screens/category_books_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Book> _favoriteBooks = [];
  // method to manage favorite trips
  // this method will be used to add or remove trips from the favorite list
  void _manageFavorite(String bookId) {
    final exsitingIndex = _favoriteBooks.indexWhere(
      (book) => book.id == bookId,
    );
    if (exsitingIndex >= 0) {
      setState(() {
        _favoriteBooks.removeAt(exsitingIndex);
      });
    } else {
      setState(() {
        _favoriteBooks.add(books_data.firstWhere((book) => book.id == bookId));
      });
    }
  }

  // method to check if the book in favorite page or not
  bool _isFavorite(String bookId) {
    return _favoriteBooks.any((book) => book.id == bookId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maktabati',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: "Sora",
            color: Color(0xFFD4A373),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "Sora",
            color: Color(0xFFD4A373),
          ),
          headlineSmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Sora",
            color: Color(0xFF4A3F35)
          ),
          bodyLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFFD4A373),
            fontFamily: 'Sora',
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Sora',
          ),
        ),
      ),
      routes: {
        '/': (context) => IntroScreen(),
        TabsScreen.screenRoute: (context) => TabsScreen(_favoriteBooks),
        CategoryScreen.screenRoute: (ctx) => CategoryScreen(),
        CategoryBooksScreen.routeName: (context) => CategoryBooksScreen(),
        BookDetailsScreen.screenRoute:
            (context) => BookDetailsScreen(_manageFavorite, _isFavorite),
        PdfScreen.screenRoute: (context) => PdfScreen(),
      },
    );
  }
}
