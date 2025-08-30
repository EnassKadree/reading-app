import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_cubit.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_states.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_cubit.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_states.dart';
import 'package:reading_app/features/category_details/view/components/category_search_bar.dart';
import 'package:reading_app/features/category_details/view/components/follow_unfollow_container.dart';
import 'package:reading_app/features/shared/data/data_source.dart';
import 'package:reading_app/features/shared/models/category.dart';
import 'package:reading_app/features/shared/widgets/books_grid.dart';
import 'package:reading_app/features/shared/widgets/list_of_books_screen/list_of_books_screen.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/lists/dummy_books.dart';
import '../../shared/widgets/error_dialog.dart';
import 'components/category_details_header.dart';

class CategoryBooksScreen extends StatelessWidget {
  CategoryBooksScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: CategoryDetailsHeader(
                categoryName: categoryModel.name,
              )),
              SliverToBoxAdapter(
                  child: CategorySearchBar(categoryId: categoryModel.id)),
              BlocBuilder<CategoryBooksCubit, CategoryBooksStates>(
                builder: (BuildContext context, CategoryBooksStates state) {
                  if (state is CategoryBooksSuccess) {
                    return BooksGrid(
                      books: state.categoryBooks,
                    );
                  } else if (state is CategoryBooksLoading) {
                    return BooksGrid(loading: true, books: dummyBook);
                  } else {
                    return SliverToBoxAdapter(
                      child: SomeThingWentWrongWidget(onPressed: () {
                        context
                            .read<CategoryBooksCubit>()
                            .getCategoryBook(categoryModel.id);
                      }),
                    );
                  }
                },
              ),
            ],
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
                if (state is FollowUnFollowCategoryError) {
                  Functions().showSnackBar(context, state.errorMessage);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
