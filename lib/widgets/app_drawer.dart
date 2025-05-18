import 'package:flutter/material.dart';
import 'package:library_app/screens/favorite_screen.dart';
import 'dart:ui';

import 'package:library_app/screens/tabs_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/History.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.9, sigmaY: 0.9),
            child: Container(color: Color.fromRGBO(0, 0, 0, 0.2)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40),
                  color: Color(0xFF4A3F35),
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Book Guide",
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 20,
                      color: Color(0xFFD4A373),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.menu_book_rounded, color: Colors.white),
                  title: Text(
                    "Categories",
                    style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(TabsScreen.screenRoute);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite_rounded, color: Colors.white),
                  title: Text(
                    "Favorite Page",
                    style: TextStyle(
                      fontFamily: 'Sora',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(FavoriteScreen.screenRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
