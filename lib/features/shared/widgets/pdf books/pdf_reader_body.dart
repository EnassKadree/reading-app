import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader/pdf_reader_cubit.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfReaderBody extends StatelessWidget {
  final String filePath;
  final int lastReadPage;

  const PdfReaderBody({
    super.key,
    required this.filePath,
    required this.lastReadPage,
  });

  @override
  Widget build(BuildContext context) {
    final PdfViewerController controller = PdfViewerController();

    return BlocBuilder<PdfReaderCubit, int>(
      builder: (context, currentPage) {
        return Stack(
          children: [
            SfPdfViewer.network(
             'assets/pdf/book1.pdf',
              //filePath,
              controller: controller,
              onPageChanged: (details) {
                context
                    .read<PdfReaderCubit>()
                    .updatePage(details.newPageNumber);
                print("===================number:$currentPage");
              },
              onDocumentLoaded: (details) {
                controller.jumpToPage(lastReadPage);
              },
              onDocumentLoadFailed: (error) {
                Functions().showSnackBar(
                  context,
                  JsonConsts.bookDownloadFailed.t(context),
                );
              },
            ),
          ],
        );
      },
    );
  }
}