import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/app_drawer.dart';
import './categories_screen.dart';
import './favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  static const screenRoute = '/tabs-screen';
  final List<Book> favoriteBooks;

  const TabsScreen(this.favoriteBooks, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  List<Map<String, Object>>? _screens;
  @override
  void initState() {
    _screens = [
      {"screen": CategoryScreen(), "title": "Categories"},
      {"screen": FavoriteScreen(widget.favoriteBooks), "title": "Favorites"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF3E0),
      drawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFD4A373), size: 25),
        title: Text(
          '${_screens![_selectedScreenIndex]['title']}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Color(0xFF4A3F35),
      ),
      body: _screens![_selectedScreenIndex]["screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Color(0xFF4A3F35),
        selectedItemColor: Color(0xFFD4A373),
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded, size: 25),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, size: 25),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
