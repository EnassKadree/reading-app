import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/widgets/book_card_mylib.dart';

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
            GridView.count(
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
                ),
                BookCard(
                  title: JsonConsts.favoriteBooks.t(context),
                  icon: Icons.favorite_border,
                ),
                BookCard(
                  title: JsonConsts.booksToRead.t(context),
                  icon: Icons.menu_book,
                  isLeftImage: true,
                ),
                BookCard(
                  title: JsonConsts.completedBooks.t(context),
                  icon: Icons.emoji_events_outlined,
                ),
              ],
            ),
            12.spaceH,
            Text(
              "${JsonConsts.iHaveVisited.t(context)} 50 ${JsonConsts.countriesInALiteraryWay.t(context)}",
              style: StylesConsts.introText.copyWith(
                  color: ColorsConsts.purple, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
