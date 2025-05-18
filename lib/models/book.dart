class Book {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final int pageNumbers;
  final String author;
  final List<String> bookDetails;
  final String pdfUrl;

  const Book({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.pageNumbers,
    required this.author,
    required this.bookDetails,
    required this.pdfUrl,
  });
}
