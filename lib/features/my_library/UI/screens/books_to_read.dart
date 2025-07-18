import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/widgets/books_to_read_builder.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class BooksToRead extends StatelessWidget {
  const BooksToRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverBar(
        title: JsonConsts.bookInProgress.t(context),
        backButtonVisibility: true,
        searchVisibility: false,
        menuVisibility: false,
      ),
      const SliverToBoxAdapter(
        child: SizedBox(height: 20),
      ),
      const BooksToReadBuilder()
    ]));
  }
}
