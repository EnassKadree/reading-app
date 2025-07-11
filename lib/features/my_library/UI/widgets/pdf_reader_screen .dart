// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// class PdfReaderScreen extends StatefulWidget {
//   final String filePath;
//   final int lastReadPage;

//   const PdfReaderScreen({
//     super.key,
//     required this.filePath,
//     this.lastReadPage = 1,
//   });

//   @override
//   State<PdfReaderScreen> createState() => _PdfReaderScreenState();
// }

// class _PdfReaderScreenState extends State<PdfReaderScreen> {
//   late PdfViewerController _pdfViewerController;
//   int currentPage = 1;

//   @override
//   void initState() {
//     super.initState();
//     _pdfViewerController = PdfViewerController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reading...'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.close),
//             onPressed: () {
//               Navigator.pop(context, currentPage); // ترجع الصفحة الحالية
//             },
//           )
//         ],
//       ),
//       body: SfPdfViewer.asset(
//         widget.filePath,
//         controller: _pdfViewerController,
//         onPageChanged: (details) {
//           currentPage = details.newPageNumber;
//         },
//         onDocumentLoaded: (details) {
//           // انتقل للصفحة الأخيرة المقروءة
//           _pdfViewerController.jumpToPage(widget.lastReadPage);
//         },
//       ),
//     );
//   }
// }
