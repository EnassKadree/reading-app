import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/services/screen_time_tracker.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/book_details/view/book_details_wrapper.dart';
import 'package:reading_app/features/my_library/UI/screens/my_library.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader_body.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/pdf_reader/pdf_reader_cubit.dart';
import 'package:reading_app/features/shared/widgets/pdf%20books/reading_progress/reading_progress_cubit.dart';

class PdfReaderScreen extends StatefulWidget {
  final String filePath;
  final int lastReadPage;
  final BookModel bookModel;

  const PdfReaderScreen({
    required this.bookModel,
    super.key,
    required this.filePath,
    this.lastReadPage = 1,
  });

  @override
  State<PdfReaderScreen> createState() => _PdfReaderScreenState();
}

class _PdfReaderScreenState extends State<PdfReaderScreen> {
  final ScreenTimeTracker _screenTimeTracker = ScreenTimeTracker();

  @override
  void initState() {
    super.initState();
    // بدء تتبع وقت القراءة
    _screenTimeTracker.startTracking(widget.bookModel.id.toString());
  }

  @override
  void dispose() {
    // إيقاف تتبع وقت القراءة
    _screenTimeTracker.stopTracking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PdfReaderCubit(widget.lastReadPage)),
        BlocProvider(create: (_) => ReadingProgressCubit()),
      ],
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              final currentPage = context.read<PdfReaderCubit>().state;

              // تحديث التقدم
              context.read<ReadingProgressCubit>().updateProgress(
                    bookId: widget.bookModel.id,
                    currentPage: currentPage,
                  );

              print("📖 User exited at page: $currentPage");

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const MyLibraryPage()),
                (route) => false,
              );

              context.read<ReadingProgressCubit>().updateProgress(
                    bookId: widget.bookModel.id,
                    currentPage: currentPage,
                  );

              if ((currentPage * 100) / widget.bookModel.numberOfPages >= 70) {
                showReadingExitDialog(
                    onExitAnyway: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyLibraryPage()),
                        (route) => false,
                      );
                    },
                    context: context,
                    bookTitle: widget.bookModel.title,
                    onRatePressed: () {
                      context.pushReplacement(BookDetailsWrapper(
                        book: widget.bookModel,
                        scrollToIndex: 10,
                        newProgress: currentPage,
                      ),
                      );
                    },
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const MyLibraryPage()),
                  (route) => false,
                );
              }
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
                filePath: widget.filePath,
                lastReadPage: widget.lastReadPage,
              ),
            ),
          );
        },
      ),
    );
  }
}
