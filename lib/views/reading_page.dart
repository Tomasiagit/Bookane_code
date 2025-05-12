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
  final TextEditingController _searchController = TextEditingController();
  late PdfTextSearchResult _searchResult;


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),

            suffixIcon: IconButton(
              icon: Icon(Icons.search,
                color: Colors.white
              ),
              onPressed: () => _search(_searchController.text),
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
      body: SfPdfViewer.network('${widget.pdfPath}',
          controller: _pdfViewerController),
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
