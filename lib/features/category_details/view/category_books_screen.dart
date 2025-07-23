import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_cubit.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_states.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/loading_screen.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBooksCubit,CategoryBooksStates>(
      builder: (BuildContext context,CategoryBooksStates state){
        if(state is CategoryBooksLoading) {
        return const LoadingScreen();
      } else  if(state is CategoryBooksSuccess) {
        return Stack(
          children: [
            ListOfBooksScreen(
              title: categoryModel.name,
              bookList: state.categoryBooks,
            ),
            Positioned(
              right: 0,
              bottom: 30,
              child: Container(
                height: 70.h,
                width: 90.h,
                decoration: BoxDecoration(
                  color: (categoryModel.isFollowed)
                      ? context.colorScheme.primary
                      : context.colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.r),
                    topLeft: Radius.circular(40.r),
                  ),
                ),

              ),
            )
          ],
        );
      } else
        {return Container(color: Colors.redAccent,);}
      }
    );
  }
}

