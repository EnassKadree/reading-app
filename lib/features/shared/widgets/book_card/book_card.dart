import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';
import '../../../book_details/view/screens/book_details_wrapper.dart';

class BookCard extends StatefulWidget {
 const BookCard({required this.bookModel, super.key});

 final BookModel bookModel;

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          BookDetailsWrapper(book: widget.bookModel),
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              top: 115.h,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(110),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                width: 165.w,
                height: 175.h,
              ),
            ),
            PositionedDirectional(
              start: 8.w,
              child: Hero(
                tag: widget.bookModel.id,
                flightShuttleBuilder: (flightContext, animation,
                    flightDirection, fromHeroContext, toHeroContext) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -1),
                      end: Offset.zero,
                    ).animate(animation),
                    child: toHeroContext.widget,
                  );
                },
                child: Container(
                  height: 210.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(160),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CustomNetworkImage(
                        imageUrl: widget.bookModel.coverImage,
                        fit: BoxFit.fill,
                      )),
                ),
              ),
            ),
            PositionedDirectional(
              start: 10.w,
              top: 216.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      1.spaceW,
                      SizedBox(
                        width: 100.w,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          widget.bookModel.title,
                          style: StylesConsts.f16W600Black,
                        ),
                      ),
                      20.spaceW,
                      BlocConsumer<BookFavoriteCubit, BookFavoriteStates>(
                        builder:
                            (BuildContext context, BookFavoriteStates state) {
                          bool isFavorite = state.favorites[widget.bookModel.id] ??
                              widget.bookModel.isFavourite;
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<BookFavoriteCubit>()
                                  .toggleFavorite(widget.bookModel.id);
                            },
                            child: Icon(
                              (isFavorite)
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: context.colorScheme.tertiary,
                            ),
                          );
                        },
                        listener:
                            (BuildContext context, BookFavoriteStates state) {
                          if (state is ErrorFavoriteState)
                            Functions()
                                .showSnackBar(context, state.errorMessage);
                        },
                      ),
                    ],
                  ),
                  5.spaceH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < widget.bookModel.starRate
                            ? Icons.star
                            : Icons.star_border,
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
