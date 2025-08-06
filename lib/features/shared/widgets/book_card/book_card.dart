import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';
import '../../../book_details/view/book_details_wrapper.dart';
class BookCard extends StatelessWidget {
  const BookCard({required this.bookModel, super.key});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return BookFavoriteCubit();
      },
      child: GestureDetector(
        onTap:(){
          context.push(BookDetailsWrapper(book: bookModel));
          },
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                top: 115.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
              Positioned(
                left: 8.w,
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
                    child: CustomNetworkImage(imageUrl: bookModel.coverImage,fit: BoxFit.fill,)
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
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
                            bookModel.title,
                            style: StylesConsts.f16W600Black,
                          ),
                        ),
                        20.spaceW,
                        BlocBuilder<BookFavoriteCubit,BookFavoriteStates>(
                            builder: (BuildContext context ,BookFavoriteStates state) {
                              return GestureDetector(
                                onTap: (){
                                  context.read<BookFavoriteCubit>().addBookToFavorites();
                                },
                                child: Icon(
                                  (bookModel.isFavourite)?
                                  Icons.favorite:
                                  Icons.favorite_border_outlined,
                                  color: Colors.redAccent.withAlpha(180),
                                ),
                              );
                            }
                        ),
                      ],
                    ),
                    5.spaceH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        5,
                            (index) => Icon(
                          index < bookModel.starRate
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
      ),
    );
  }
}
