import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/my_library/UI/widgets/card_in_progress.dart';

class BookInProgrees extends StatelessWidget {
  const BookInProgrees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height / 1.0,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CardInProgress().staggerListHorizontal(index);
        },
      ),
    ));
  }
}
