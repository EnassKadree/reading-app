import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  const UserActionButtons({ required this.book,super.key});
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
                icon: Iconsax.book,
                label: 'open to read',
                color: Colors.blue[300]!,
                opacity: 1,
                onTap: ()async {
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
            BlocConsumer<BookFavoriteCubit,BookFavoriteStates>(
              builder: (BuildContext context ,BookFavoriteStates state) {
                book.isFavourite=state.favorites[book.id] ?? false;
                bool favorite= book.isFavourite;
                return  Expanded(
                  child: BuildMyLibrary(
                    icon:(favorite)? Iconsax.heart5:Iconsax.heart,
                    label:(favorite)?'remove from favorite':'add to favorite',
                    color: context.colorScheme.tertiary,
                    onTap: () {
                      context.read<BookFavoriteCubit>().toggleFavorite(book.id);
                    },
                    opacity: 1,
                  ),
                );
              }, listener: (BuildContext context ,BookFavoriteStates state) {
              if(state is ErrorFavoriteState) {
                Functions()
                    .showSnackBar(context, state.errorMessage);
              }
            },
            ),
            12.spaceW,
            BlocConsumer<AddToReadCubit,AddToReadStates>(
              builder: (BuildContext context ,AddToReadStates state) {
                if(state is SuccessAddToReadState) {
                  bool isInLibrary=book.isInLibrary;
                 book.isInLibrary = !isInLibrary;
                }
                bool inLibrary= book.isInLibrary;
                return Expanded(
                  child: BuildMyLibrary(
                    icon:(inLibrary)? Iconsax.task_square5 : Iconsax.task_square,
                    label:(inLibrary)?'remove from to read': 'add to read',
                    opacity: 1,
                    color: context.colorScheme.secondary,
                    onTap: () {
                      context.read<AddToReadCubit>().addBookToRead(book.id);
                    },
                  ),
                );
              }, listener: (BuildContext context ,AddToReadStates state) {  },
            ),

            12.spaceW,
            Expanded(
              child: BuildMyLibrary(
                icon: Iconsax.link5,
                opacity: 1,
                label: 'summary link',
                color: Colors.purple[200]!,
                onTap: () {
    if (book.summary.isNotEmpty) {
    final Uri uri = Uri.parse(book.summary);
    launchUrl(uri, mode: LaunchMode.externalApplication);
    }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
