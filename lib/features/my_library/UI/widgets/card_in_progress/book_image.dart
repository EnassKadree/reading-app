import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';

class BookImage extends StatelessWidget {
  final BookModel book;
  const BookImage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -30,
      left: 15,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorsConsts.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.05 * 255).toInt()),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          // child: Image.asset('assets/images/png/book 3.jpg',fit: BoxFit.fill,),
          child:
              CustomNetworkImage(imageUrl: book.coverImage),
        ),
      ),
    );
  }
}
