import 'package:flutter/material.dart';
import 'package:library_app/app_data.dart';
import 'package:library_app/screens/pdf_screen.dart';
import 'dart:ui';

class BookDetailsScreen extends StatelessWidget {
  // const BookDetailsScreen({super.key});
  final Function manageFavorite;
  final Function isFavorite;
  const BookDetailsScreen(this.manageFavorite, this.isFavorite, {super.key});

  static const screenRoute = '/book-details-screen';
  void selectedPdf(BuildContext context, String pdfUrl, String bookTitle) {
    // Navigate to the PDF screen

    Navigator.of(context).pushNamed(
      PdfScreen.screenRoute,
      arguments: {'pdfUrl': pdfUrl, 'title': bookTitle},
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final bookId = routeArgs['id'];
    // final bookTitle = routeArgs['title'];
    final backgroundImage = routeArgs['imageUrl'];
    final selectedBook = books_data.firstWhere((book) => book.id == bookId);
    return Scaffold(
      backgroundColor: Color(0xFFFAF3E0),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFD4A373), size: 25),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          selectedBook.title,
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
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  // height: 300,
                  child: Image.asset(
                    selectedBook.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Book Details",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Color(0xFF4A3F35),
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder:
                        (context, index) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Text(
                            selectedBook.bookDetails[index],
                            style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    itemCount: selectedBook.bookDetails.length,
                  ),
                ),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xFFD4A373),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.fromLTRB(15, 15, 15, 30),
                  child: TextButton(
                    onPressed: () {
                      selectedPdf(
                        context,
                        selectedBook.pdfUrl,
                        selectedBook.title,
                      );
                    },
                    child: Text(
                      "Click to read",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4A3F35),
        child: Icon(
          color: Color(0xFFD4A373),
          isFavorite(bookId) ? Icons.favorite : Icons.favorite_border_rounded,
        ),
        onPressed: () {
          manageFavorite(bookId);
        },
      ),
    );
  }
}
