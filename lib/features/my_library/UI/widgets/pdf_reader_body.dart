import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderBody extends StatefulWidget {
  final String filePath;
  final int lastReadPage;

  const PdfReaderBody({
    super.key,
    required this.filePath,
    required this.lastReadPage,
  });
  // ignore: library_private_types_in_public_api
  static _PdfReaderBodyState? of(BuildContext context) {
    return context.findAncestorStateOfType<_PdfReaderBodyState>();
  }

  @override
  State<PdfReaderBody> createState() => _PdfReaderBodyState();
}

class _PdfReaderBodyState extends State<PdfReaderBody> {
  late PdfViewerController _controller;
  int currentPage = 1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SfPdfViewer.network(
          widget.filePath,
          controller: _controller,
          onPageChanged: (details) {
            setState(() {
              currentPage = details.newPageNumber;
              print("===================number:$currentPage");
            });
          },
          onDocumentLoaded: (details) {
            _controller.jumpToPage(widget.lastReadPage);
            setState(() {
              isLoading = false;
            });
          },
          onDocumentLoadFailed: (error) {
            setState(() {
              isLoading = false;
            });

            Functions().showSnackBar(
                context, JsonConsts.bookDownloadFailed.t(context));
          },
        ),
      ],
    );
  }
}
