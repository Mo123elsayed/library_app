import 'package:flutter/material.dart';
import 'package:library_app/screens/book_details_screen.dart';

class BookItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int pageNumbers;
  final String author;

  const BookItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.pageNumbers,
    required this.author,
  });

  void selectedBook(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      BookDetailsScreen.screenRoute,
      arguments: {'id': id, 'imageUrl': imageUrl},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedBook(context),
      splashColor: Colors.blueAccent,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            // margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.2, 1],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xFF4A3F35),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.book),
                          Text(
                            '$pageNumbers',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.person_2_rounded),
                          Text(
                            author,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
