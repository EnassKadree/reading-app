import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/UI/widgets/books_in_progress_builder.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class BookInProgrees extends StatelessWidget {
  const BookInProgrees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverBar(
            title: JsonConsts.bookInProgress.t(context),
            backButtonVisibility: true,
            searchVisibility: false,
            menuVisibility: false,
          ),
          const BooksInProgressBuilder(),
        ],
      ),
    );
  }
}
