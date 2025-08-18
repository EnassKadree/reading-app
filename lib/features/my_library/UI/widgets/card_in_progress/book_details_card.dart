import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader_screen.dart';
import 'package:reading_app/features/my_library/services/book_pdf/book_pdf_cubit.dart';
import 'package:reading_app/features/shared/models/book.dart';

class BookDetailsCard extends StatelessWidget {
  final BookModel book;
  const BookDetailsCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          final cubit = context.read<BookPdfCubit>();
          await cubit.getBookPdf(book.id);
          final state = cubit.state;
          if (state is BookPdfSuccess) {
            final pdf = state.bookPdf;

            // ignore: use_build_context_synchronously
            await context.push(
              PdfReaderScreen(
                filePath: pdf.pdfUrl,
                lastReadPage: book.progress ?? 1,
                bookId: book.id,
              ),
            );
          } else if (state is BookPdfFailure) {
            // ignore: use_build_context_synchronously
            Functions().showSnackBar(
                // ignore: use_build_context_synchronously
                context, JsonConsts.theBookFailedToLoad.t(context));
          }
        },
        child: Container(
          padding:
              const EdgeInsets.only(left: 130, right: 16, top: 6, bottom: 16),
          decoration: BoxDecoration(
            color: ColorsConsts.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((0.05 * 255).toInt()),
                blurRadius: 6,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: StylesConsts.f16W600Black),
              12.spaceH,
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < book.starRate.round()
                        ? Icons.star
                        : Icons.star_border,
                    color: Colors.yellow[700],
                    size: 20,
                  ),
                ),
              ),
              8.spaceH,
              LinearProgressIndicator(
                value: (book.numberOfPages > 0)
                    ? ((book.progress ?? 1) / book.numberOfPages.toDouble())
                        .clamp(0.0, 1.0)
                    : 0.0,
                backgroundColor: Colors.grey.shade200,
                color: ColorsConsts.purple,
                minHeight: 6,
                borderRadius: BorderRadius.circular(8),
              ),
              8.spaceH,
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${book.progress ?? 1} / ${book.numberOfPages}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
