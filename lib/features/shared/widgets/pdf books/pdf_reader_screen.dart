import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/features/my_library/UI/screens/my_library.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader_body.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader/pdf_reader_cubit.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/reading_progress/reading_progress_cubit.dart';

class PdfReaderScreen extends StatelessWidget {
  final String filePath;
  final int lastReadPage;
  final int bookId;

  const PdfReaderScreen({
    super.key,
    required this.filePath,
    required this.bookId,
    this.lastReadPage = 1,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PdfReaderCubit(lastReadPage)),
        BlocProvider(create: (_) => ReadingProgressCubit()),
      ],
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              final currentPage = context.read<PdfReaderCubit>().state;

              context.read<ReadingProgressCubit>().updateProgress(
                    bookId: bookId,
                    currentPage: currentPage,
                  );

              print("📖 User exited at page: $currentPage");
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyLibraryPage()),
                (route) => false,
              );
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
        },
      ),
    );
  }
}
