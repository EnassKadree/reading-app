import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_book_card_grid.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_map_container.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_visited_countries_text.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class MyLibraryBody extends StatelessWidget {
  const MyLibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverBar(
          title: "My Library",
          searchVisibility: false,

        ),
        SliverBookCardGrid(),
        SliverVisitedCountriesText(),
        SliverMapContainer(),
        SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }
}