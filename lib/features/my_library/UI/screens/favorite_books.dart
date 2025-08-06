import 'package:flutter/material.dart';
import 'package:reading_app/features/my_library/UI/widgets/favorite_books_builder.dart';

class FavoriteBooks extends StatelessWidget {
  const FavoriteBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:
      FavoriteBooksBuilder()
   );
  }
}
