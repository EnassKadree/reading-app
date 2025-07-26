import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_cubit.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_states.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/loading_screen.dart';

import '../../shared/widgets/error_dialog.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBooksCubit, CategoryBooksStates>(
      builder: (BuildContext context, CategoryBooksStates state) {
        if (state is CategoryBooksLoading) {
          return const LoadingScreen();
        } else if (state is CategoryBooksSuccess) {
          return Stack(
            children: [
              ListOfBooksScreen(
                title: categoryModel.name,
                bookList: state.categoryBooks,
              ),
              Positioned(
                right: 0.w,
                bottom: 30.h,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withAlpha(200),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      topLeft: Radius.circular(40.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      10.spaceW,
                      Icon(Icons.add_circle_outline,
                          size: 20,
                          color: context.colorScheme.surfaceContainer),
                      10.spaceW,
                      Text(
                        'Follow',
                        style: TextStyle(
                          letterSpacing: 0.6,
                          color: context.colorScheme.surfaceContainer,
                          fontSize: 16.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      10.spaceW
                    ],
                  ),
                ),
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
      listener: (BuildContext context, CategoryBooksStates state) {
        if (state is CategoryBooksError) {
          showCustomErrorDialog(
              onPressed: () {
                context
                    .read<CategoryBooksCubit>()
                    .getCategoryBook(categoryModel.id);

                Navigator.pop(context);
              },
              context: context,
              message: state.errorMessage);
        }
      },
    );
  }
}
