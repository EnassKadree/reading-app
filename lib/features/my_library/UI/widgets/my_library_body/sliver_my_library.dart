import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:reading_app/core/utils/constants/json_consts.dart';

import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/screens/book_in_progrees.dart';
import 'package:reading_app/features/my_library/UI/screens/books_to_read.dart';
import 'package:reading_app/features/my_library/UI/screens/completed_books.dart';
import 'package:reading_app/features/my_library/UI/screens/favorite_books.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/build_my_library.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/label_labrary_stats.dart';
import 'package:reading_app/features/my_library/services/book_pdf/book_pdf_cubit.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import 'package:reading_app/features/my_library/services/favorite_books/favorite_books_cubit.dart';
import 'package:reading_app/features/my_library/services/in_read/in_read_cubit.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';

class SlivermyLibrary extends StatelessWidget {
  const SlivermyLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LibrarySectionLabel(
                  title: JsonConsts.mylibrary.t(context),
                  icon: Iconsax.folder_favorite,
                ),
              ),
              4.spaceH,
              Row(
                children: [
                  Expanded(
                    child: buildmyLibrary(
                      icon: Iconsax.bookmark,
                      label: JsonConsts.bookInProgress.t(context),
                      color: Colors.blue[600]!,
                      onTap: () {
                        context.push(
                          MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      InReadCubit()..getInReadBooks()),
                              BlocProvider(create: (_) => BookPdfCubit()),
                            ],
                            child: const BookInProgrees(),
                          ),
                        );
                      },
                    ),
                  ),
                  12.spaceW,
                  Expanded(
                    child: buildmyLibrary(
                      icon: Iconsax.heart,
                      label: JsonConsts.favoriteBooks.t(context),
                      color: Colors.pink[300]!,
                      onTap: () {
                        context.push(
                          BlocProvider(
                            create: (_) =>
                                FavoriteBooksCubit()..getFavoriteBooks(),
                            child: const FavoriteBooks(),
                          ),
                        );
                      },
                    ),
                  ),
                  12.spaceW,
                  Expanded(
                    child: buildmyLibrary(
                      icon: Iconsax.book,
                      label: JsonConsts.booksToRead.t(context),
                      color: Colors.amber[600]!,
                      onTap: () {
                        context.push(
                          BlocProvider(
                            create: (_) => ToReadCubit()..getToReadBooks(),
                            child: const BooksToRead(),
                          ),
                        );
                      },
                    ),
                  ),
                  12.spaceW,
                  Expanded(
                    child: buildmyLibrary(
                      icon: Iconsax.book_saved,
                      label: JsonConsts.finishedBooks.t(context),
                      color: Colors.purple[600]!,
                      onTap: () {
                        context.push(
                          BlocProvider(
                            create: (_) =>
                                CompletedBooksCubit()..getCompletedBooks(),
                            child: const CompletedBooks(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
