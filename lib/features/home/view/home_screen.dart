import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/view/components/authors_section.dart';
import 'package:reading_app/features/home/view/components/books_section.dart';
import 'package:reading_app/features/home/view/components/categories_section.dart';

import 'components/home_purple_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(color:context.colorScheme.primary,),
            elevation: 0,
            floating: true,
            actions: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  color: context.colorScheme.surfaceContainer,
                ),),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.list,
                  color: context.colorScheme.surfaceContainer,
                ),).horizontalPadding,

            ],
          ),
          SliverToBoxAdapter(
            child: HomePurpleContainer(searchController: searchController),
          ),
          SliverToBoxAdapter(
              child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const CategoriesSection(),
               const AuthorsSection(),
             Text(
                JsonConsts.mostRatedBooks.t(context),
                style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
             ).mainPadding,],
          ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver  : BooksSection())

        ],
      ),
    );
  }
}
