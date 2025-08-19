import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_cubit.dart';

import '../../shared/models/category.dart';
import '../service/category_books/category_books_cubit.dart';
import 'category_books_screen.dart';

class CategoryBooksScreenWrapper extends StatelessWidget {
  const CategoryBooksScreenWrapper({required this.category, super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (BuildContext context) {
        return CategoryBooksCubit()..getCategoryBook(category.id);
      },),
        BlocProvider(
          create: (BuildContext context) {
            return FollowUnFollowCategoryCubit(isFollowed:category.isFollowed);
          },)
      ],
      child: CategoryBooksScreen(categoryModel: category),
    );
  }
}