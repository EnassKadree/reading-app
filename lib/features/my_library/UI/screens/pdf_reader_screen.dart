import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/my_library/UI/widgets/pdf_reader_body.dart';

class PdfReaderScreen extends StatelessWidget {
  final String filePath;
  final int lastReadPage;

  const PdfReaderScreen({
    super.key,
    required this.filePath,
    this.lastReadPage = 1,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final currentPage =
            PdfReaderBody.of(context)?.currentPage ?? lastReadPage;
        context.pop(currentPage);
        print("User exited at page: $currentPage");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reading...',
            style: TextStyle(color: ColorsConsts.purple),
          ),
        ),
        body: PdfReaderBody(
          filePath: filePath,
          lastReadPage: lastReadPage,
        ),
      ),
    );
  }
}
