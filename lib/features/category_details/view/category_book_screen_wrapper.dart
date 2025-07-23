import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/models/category.dart';
import '../service/category_books/category_books_cubit.dart';
import 'category_books_screen.dart';

class CategoryBooksScreenWrapper extends StatelessWidget {
  const CategoryBooksScreenWrapper({required this.category, super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CategoryBooksCubit()..getCategoryBook(category.id);
      },
      child: CategoryBooksScreen(categoryModel: category),
    );
  }
}