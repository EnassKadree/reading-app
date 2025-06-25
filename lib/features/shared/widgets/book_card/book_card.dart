import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BookFavoriteCubit();
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: context.colorScheme.secondary.withAlpha(120),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 130,
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
            20.spaceH,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.spaceH,
                const Text(
                  "Love Story",
                  style: StylesConsts.f18W600Black,
                ),
                25.spaceW,
                Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.redAccent.withAlpha(150),
                ),
              ],
            ),
            5.spaceH,
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
            )
          ],
        ),
      ),
    );
  }
}
