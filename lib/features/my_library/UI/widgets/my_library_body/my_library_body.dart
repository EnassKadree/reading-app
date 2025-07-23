import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/UI/screens/book_in_progrees.dart';
import 'package:reading_app/features/my_library/UI/screens/books_to_read.dart';
import 'package:reading_app/features/my_library/UI/screens/completed_books.dart';
import 'package:reading_app/features/my_library/UI/screens/favorite_books.dart';
import 'package:reading_app/features/my_library/UI/widgets/book_card_mylib.dart';
import 'package:reading_app/features/my_library/UI/widgets/map_builder.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_book_card_grid.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_map_container.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/sliver_visited_countries_text.dart';
import 'package:reading_app/features/my_library/services/book_pdf/book_pdf_cubit.dart';
import 'package:reading_app/features/my_library/services/complered_books/completed_books_cubit.dart';
import 'package:reading_app/features/my_library/services/country_book_count/country_book_count_cubit.dart';
import 'package:reading_app/features/my_library/services/favorite_books/favorite_books_cubit.dart';
import 'package:reading_app/features/my_library/services/in_read/in_read_cubit.dart';
import 'package:reading_app/features/my_library/services/to_read/to_read_cubit.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class MyLibraryBody extends StatelessWidget {
  const MyLibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const [
        SliverBar(
          title: "My Library", // إذا في ترجمة، خليه مثل ما هو
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