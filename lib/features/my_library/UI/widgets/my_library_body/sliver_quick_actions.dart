import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/screens/book_in_progrees.dart';
import 'package:reading_app/features/my_library/UI/screens/books_to_read.dart';
import 'package:reading_app/features/my_library/UI/screens/completed_books.dart';
import 'package:reading_app/features/my_library/UI/screens/favorite_books.dart';
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
                padding: const EdgeInsets.only(left: 4, bottom: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorsConsts.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Iconsax.folder_favorite,
                        color: ColorsConsts.purple,
                        size: 20,
                      ),
                    ),
                    12.spaceW,
                    Text(
                      JsonConsts.mylibrary.t(context),
                      style: StylesConsts.f16W600Black.copyWith(
                        color: ColorsConsts.purple,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildmyLibrary(
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
                    child: _buildmyLibrary(
                      icon: Iconsax.heart,
                      label: JsonConsts.favoriteBooks.t(context),
                      color: Colors.green[600]!,
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
                    child: _buildmyLibrary(
                      icon: Iconsax.book,
                      label: JsonConsts.booksToRead.t(context),
                      color: Colors.orange[600]!,
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
                    child: _buildmyLibrary(
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

  Widget _buildmyLibrary({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            ),
            8.spaceH,
            Text(
              label,
              style: StylesConsts.f15W400Grey.copyWith(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
