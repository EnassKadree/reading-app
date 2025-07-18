import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BookFavoriteCubit();
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 110,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(110),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                width: 165,
                height: 165,
              ),
            ),
            Positioned(
              left: 8,
              child: Container(
                height: 210,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(160),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/images/png/book 1.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 216,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      1.spaceW,
                      const Text(
                        "Love Story",
                        style: StylesConsts.f16W600Black,
                      ),
                      20.spaceW,
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.redAccent.withAlpha(180),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < 3 ? Icons.star : Icons.star_border,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
