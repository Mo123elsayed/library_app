import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  static const screenRoute = '/pdf-screen';

  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  final TextEditingController _searchController = TextEditingController();

  String? pdfUrl;
  String? bookTitle;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    pdfUrl = routeArgs['pdfUrl']!;
    bookTitle = routeArgs['title']!;
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Search'),
            content: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelStyle: TextStyle(fontSize: 20),
                hintText: 'Enter search term',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  final query = _searchController.text.trim();
                  if (query.isNotEmpty) {
                    _pdfViewerController.searchText(query);
                  }
                },
                child: Text('Search'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pdfViewerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFD4A373), size: 25),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          bookTitle!,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Color(0xFF4A3F35),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: _showSearchDialog,
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        pdfUrl!,
        key: _pdfViewerKey,
        controller: _pdfViewerController,
        enableTextSelection: true,
        canShowScrollHead: true,
        canShowScrollStatus: true,
        scrollDirection: PdfScrollDirection.vertical,
        pageLayoutMode: PdfPageLayoutMode.continuous,
      ),
    );
  }
}
