import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/widgets/completed_books_builder.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class CompletedBooks extends StatelessWidget {
  const CompletedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverBar(
        title: JsonConsts.completedBooks.t(context),
        backButtonVisibility: true,
        searchVisibility: false,
        menuVisibility: false,
      ),
      const SliverToBoxAdapter(
        child: SizedBox(height: 20),
      ),
      const CompletedBooksBuilder()
    ]));
  }
}