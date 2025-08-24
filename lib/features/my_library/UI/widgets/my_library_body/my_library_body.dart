import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_book_card_grid.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_library_stats.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_map_container.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_quick_actions.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_visited_countries_text.dart';

class MyLibraryBody extends StatelessWidget {
  const MyLibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 18)),
        SlivermyLibrary(),
        SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverLibraryStats(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverVisitedCountriesText(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverMapContainer(),
        SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
