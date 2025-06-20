import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadingPage extends StatefulWidget {
  static const String routeName = '/ReadingPage';
  final String? pdfPath;

  const ReadingPage({super.key, required this.pdfPath});


  @override
  State<ReadingPage> createState() => _ReadingPageState();
}




class _ReadingPageState extends State<ReadingPage> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
 // final TextEditingController _searchController = TextEditingController();
  final TextEditingController _pageInputController = TextEditingController();
  late PdfTextSearchResult _searchResult;
  int _currentPage = 1;
  int _totalPages = 0;
  bool _showControls = true;


  void initState() {
    _searchResult = PdfTextSearchResult();
    super.initState();
  }

  void _search(String text) {
    _searchResult = _pdfViewerController.searchText(text);
    _searchResult.addListener(() {
      setState(() {});
    });
  }

  void _goToPage() {
    final input = int.tryParse(_pageInputController.text);
    if (input != null && input >= 1 && input <= _totalPages) {
      _pdfViewerController.jumpToPage(input);
      FocusScope.of(context).unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Número de página inválido')),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _pageInputController,
          decoration: InputDecoration(
            hintText: 'Search...',
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

            suffixIcon: IconButton(
              icon: Icon(Icons.search,
                color: Colors.white
              ),
              onPressed: () => _search(_pageInputController.text),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_upward,
                color: Colors.white),
            onPressed: () => _searchResult.previousInstance(),
          ),
          IconButton(
            icon: Icon(Icons.arrow_downward,
                color: Colors.white),
            onPressed: () => _searchResult.nextInstance(),
          ),
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            _showControls = !_showControls;
          });
        },
        child: Stack(
          children: [
            SfPdfViewer.network('${widget.pdfPath}',
                controller: _pdfViewerController,
              onDocumentLoaded: (details) {
                setState(() {
                  _totalPages = details.document.pages.count;
                });
              },
              onPageChanged: (details) {
                setState(() {
                  _currentPage = details.newPageNumber;
                });
              },
            ),
            if (_showControls)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left, color: Colors.white),
                        onPressed: _currentPage > 1
                            ? () => _pdfViewerController.jumpToPage(_currentPage - 1)
                            : null,
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right, color: Colors.white),
                        onPressed: _currentPage < _totalPages
                            ? () => _pdfViewerController.jumpToPage(_currentPage + 1)
                            : null,
                      ),
                      Spacer(),
                      Text('Page:', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 60,
                        child: TextField(
                          controller: _pageInputController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                            border: OutlineInputBorder(),
                            hintText: 'Go',
                            hintStyle: TextStyle(color: Colors.white60),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _goToPage,
                        child: Text('Go'),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      //Stack(
      //    children: <Widget>[
      //     PDFView(
      //       filePath: widget.pdfPath,
      //       enableSwipe: true,
      //       swipeHorizontal: true,
      //       autoSpacing: false,
      //       pageFling: true,
      //       pageSnap: true,
      //       defaultPage: currentPage!,
      //       fitPolicy: FitPolicy.BOTH,
      //       preventLinkNavigation:
      //           false, // if set to true the link is handled in flutter
      //       onRender: (_pages) {
      //         setState(() {
      //           pages = _pages;
      //           isReady = true;
      //         });
      //       },
      //       onError: (error) {
      //         setState(() {
      //           errorMessage = error.toString();
      //         });
      //         print(error.toString());
      //       },
      //       onPageError: (page, error) {
      //         setState(() {
      //           errorMessage = '$page: ${error.toString()}';
      //         });
      //         print('$page: ${error.toString()}');
      //       },
      //       onViewCreated: (PDFViewController pdfViewController) {
      //         _controller.complete(pdfViewController);
      //       },
      //       onLinkHandler: (String? uri) {
      //         print('goto uri: $uri');
      //       },
      //       onPageChanged: (int? page, int? total) {
      //         print('page change: $page/$total');
      //         setState(() {
      //           currentPage = page;
      //         });
      //       },
      //     ),
      //     errorMessage.isEmpty
      //         ? !isReady
      //             ? Center(
      //                 child: CircularProgressIndicator(),
      //               )
      //             : Container()
      //         : Center(
      //             child: Text(errorMessage),
      //           )
      //   ],
      // ),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${pages! ~/ 2}"),
      //         onPressed: () async {
      //           await snapshot.data!.setPage(pages! ~/ 2);
      //         },
      //       );
      //     }

      //     return Container();
      //   },
      // ),
    );
  }
}
