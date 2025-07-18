import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/UI/screens/book_in_progrees.dart';
import 'package:reading_app/features/my_library/UI/screens/books_to_read.dart';
import 'package:reading_app/features/my_library/UI/screens/completed_books.dart';
import 'package:reading_app/features/my_library/UI/widgets/book_card_mylib.dart';
import 'package:reading_app/features/my_library/UI/widgets/svg_interactive_map.dart';
import 'package:reading_app/features/my_library/services/book_pdf/book_pdf_cubit.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import 'package:reading_app/features/my_library/services/in_read/in_read_cubit.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';

class MyLibraryBody extends StatelessWidget {
  const MyLibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              JsonConsts.mylibrary.t(context),
              style:
                  StylesConsts.headerTxt.copyWith(color: ColorsConsts.purple),
            ),
            24.spaceH,
            AnimationLimiter(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  BookCard(
                    title: JsonConsts.bookInProgress.t(context),
                    icon: Icons.bookmark_outline,
                    isLeftImage: true,
                    onTap: () {
                      context.push(
                        MultiBlocProvider(
                          providers: [
                            BlocProvider(
                                create: (_) => InReadCubit()..getInReadBooks()),
                            BlocProvider(create: (_) => BookPdfCubit()),
                          ],
                          child: const BookInProgrees(),
                        ),
                      );
                    },
                  ).staggeredGrid(0),
                  BookCard(
                    title: JsonConsts.favoriteBooks.t(context),
                    icon: Icons.favorite_border,
                    onTap: () {},
                  ).staggeredGrid(1),
                  BookCard(
                    title: JsonConsts.booksToRead.t(context),
                    icon: Icons.menu_book,
                    isLeftImage: true,
                    onTap: () {
                      context.push(BlocProvider(
                          create: (context) => ToReadCubit()..getToReadBooks(),
                          child: const BooksToRead()));
                    },
                  ).staggeredGrid(2),
                  BookCard(
                    title: JsonConsts.completedBooks.t(context),
                    icon: Icons.emoji_events_outlined,
                    onTap: () {
                      context.push(BlocProvider(
                          create: (context) =>
                              CompletedBooksCubit()..getCompletedBooks(),
                          child: const CompletedBooks()));
                    },
                  ).staggeredGrid(3),
                ],
              ),
            ),
            12.spaceH,
            Row(
              children: [
                const Icon(Icons.airplanemode_active_outlined),
                6.spaceW,
                Expanded(
                  child: Text(
                    maxLines: 2,
                    "${JsonConsts.iHaveVisited.t(context)} 50 ${JsonConsts.countriesInALiteraryWay.t(context)}",
                    style: StylesConsts.introText.copyWith(
                      color: ColorsConsts.purple,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
            12.spaceH,
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.25,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: ColorsConsts.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: const SvgInteractiveMap(
                highlightedCountries: {
                  'SY': 4,
                  'FR': 10,
                  'AU': 7,
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
