import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../my_library/UI/widgets/my_library_body/build_my_library.dart';
import '../../../my_library/services/book_pdf/book_pdf_cubit.dart';
import '../../../shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';
import '../../../shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';
import '../../../shared/widgets/pdf books/pdf_reader_screen.dart';
import '../../service/add_to_read/add_to_read_cubit.dart';
import '../../service/add_to_read/add_to_read_states.dart';

class UserActionButtons extends StatelessWidget {
  const UserActionButtons({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: BuildMyLibrary(
                padding: 10,
                icon: Iconsax.book,
                label: JsonConsts.read.t(context),
                color: Colors.blue[300]!,
                //  opacity: 1,
                onTap: () async {
                  final cubit = context.read<BookPdfCubit>();
                  await cubit.getBookPdf(book.id);
                  final state = cubit.state;
                  if (state is BookPdfSuccess) {
                    final pdf = state.bookPdf;
                    await context.push(
                      PdfReaderScreen(
                        filePath: pdf.pdfUrl,
                        lastReadPage: book.progress ?? 1,
                        bookModel: book,
                      ),
                    );
                  } else if (state is BookPdfFailure) {
                    Functions().showSnackBar(
                        context, JsonConsts.theBookFailedToLoad.t(context));
                  }
                },
              ),
            ),
            12.spaceW,
            BlocConsumer<BookFavoriteCubit, BookFavoriteStates>(
              builder: (BuildContext context, BookFavoriteStates state) {
                book.isFavourite = state.favorites[book.id] ?? false;
                bool favorite = book.isFavourite;
                return Expanded(
                  child: BuildMyLibrary(
                    padding: 10,
                    icon: (favorite) ? Iconsax.heart5 : Iconsax.heart,
                    label: JsonConsts.favorite.t(context),
                    color: Colors.pink[300]!,
                    opacity: 0.8,
                    onTap: () {
                      context.read<BookFavoriteCubit>().toggleFavorite(book.id);
                    },
                    //  opacity: 1,
                  ),
                );
              },
              listener: (BuildContext context, BookFavoriteStates state) {
                if (state is ErrorFavoriteState) {
                  Functions().showSnackBar(context, state.errorMessage);
                }
              },
            ),
            12.spaceW,
            BlocConsumer<AddToReadCubit, AddToReadStates>(
              builder: (BuildContext context, AddToReadStates state) {
                if (state is SuccessAddToReadState) {
                  bool isInLibrary = book.isInLibrary;
                  book.isInLibrary = !isInLibrary;
                }
                bool inLibrary = book.isInLibrary;
                return Expanded(
                  child: BuildMyLibrary(
                    padding: 10,
                    icon: (inLibrary)
                        ? Iconsax.task_square5
                        : Iconsax.task_square,
                    label: JsonConsts.toRead.t(context),
                     opacity: 0.5,
                    color: Colors.amber[500]!,
                    onTap: () {
                      context.read<AddToReadCubit>().addBookToRead(book.id);
                    },
                  ),
                );
              },
              listener: (BuildContext context, AddToReadStates state) {},
            ),
            12.spaceW,
            Expanded(
              child: BuildMyLibrary(
                padding:10,
                  icon: Iconsax.link5,
                  // opacity: 1,
                  label: JsonConsts.summary.t(context),
                  color: Colors.purple[300]!,
                  onTap: () {
                    if (book.summary.isNotEmpty) {
                      final Uri uri = Uri.parse(book.summary);
                      launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
