import 'package:flutter/material.dart';
import 'package:reading_app/features/author_details/view/widgets/image_name_container.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/widgets/sliver_app_bar.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({ required this.author,super.key});
 final Author author;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
  body: CustomScrollView(
    slivers: [
      SliverBar(backButtonVisibility: true,),
      SliverToBoxAdapter(
        child: ImageNameContainer(),
      )
    ],
  ),
    );
  }
}
