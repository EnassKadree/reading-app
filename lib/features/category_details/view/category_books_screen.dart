import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_cubit.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_states.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_cubit.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_states.dart';
import 'package:reading_app/features/category_details/view/components/follow_unfollow_container.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/lists/dummy_books.dart';
import '../../shared/widgets/error_dialog.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    print('====================================================');
    print(categoryModel.id);
    return Stack(
      children: [
        BlocConsumer<CategoryBooksCubit, CategoryBooksStates>(
          builder: (BuildContext context, CategoryBooksStates state) {
            if (state is CategoryBooksLoading) {
              return Skeletonizer(
                  child: ListOfBooksScreen(
                title: categoryModel.name,
                bookList: dummyBook,
                isLoading: true,
              ));
            } else if (state is CategoryBooksSuccess) {
              return ListOfBooksScreen(
                title: categoryModel.name,
                bookList: state.categoryBooks,
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
        ),
        Positioned(
          right: 3.w,
          bottom: 30.h,
          child: BlocConsumer<FollowUnFollowCategoryCubit,
              FollowUnFollowCategoryStates>(
            builder:
                (BuildContext context, FollowUnFollowCategoryStates state) {
              if (state is FollowUnFollowCategoryInitial ||
                  state is FollowUnFollowCategorySuccess) {
                if (state is FollowUnFollowCategorySuccess) {
                  categoryModel.isFollowed = state.isFollowed;
                }
                return GestureDetector(
                  onTap: () {
                    if (!categoryModel.isFollowed) {
                      context
                          .read<FollowUnFollowCategoryCubit>()
                          .followCategory(categoryModel.id);
                    } else {
                      context
                          .read<FollowUnFollowCategoryCubit>()
                          .unFollowCategory(categoryModel.id);
                    }
                  },
                  child: FollowUnfollowContainer(
                      isFollowed: categoryModel.isFollowed),
                );
              }
              if (state is FollowUnFollowCategoryLoading) {
                return FollowUnfollowContainer(
                  isLoading: true,
                  isFollowed: state.isFollowed,
                );
              } else {
                return const SizedBox();
              }
            },
            listener:
                (BuildContext context, FollowUnFollowCategoryStates state) {
              if (state is FollowUnFollowCategoryError)
                Functions().showSnackBar(context, state.errorMessage);
            },
          ),
        )
      ],
    );
  }
}
