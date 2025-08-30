import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/book.dart';
 import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/widgets/custom_network_image.dart';
import '../../helpers/share_plus_function.dart';
import 'book_image_shader_mask.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({ required this.book,super.key});
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 480.h,
            child: BookImageShaderMask(
              bookImage: book.coverImage,
            ),
        ),
        Positioned(
          top: 35.h,
          right: 15.w,
          child: IconButton(
            icon: Icon(Iconsax.share, color: context.colorScheme.onPrimary),
            onPressed: () {
              shareBookDetails(
                image: book.coverImage,
                title: book.title,
                author: book.authorName,
                appLink: EndPoint.appLink,
              );
            },
          ),
        ),
        Positioned(
          top: 35.h,
          left: 10.w,
          child: IconButton(
            icon: Icon(Iconsax.arrow_left_2,color: context.colorScheme.onPrimary,),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        Positioned(
          top: 100.h,
          child: SizedBox(
            width: 1.sw,
            child: Column(
              children: [
                Hero(
                  tag: book.id,
                  flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -1), // من فوق
                        end: Offset.zero,
                      ).animate(animation),
                      child: toHeroContext.widget,
                    );

                  },
                  child: Container(
                    width: 200.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.r),
                      child: CustomNetworkImage(
                        imageUrl: book.coverImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                22.spaceH,
                Text(
                  book.title,
                  style: StylesConsts.f20BoldBlack,
                  textAlign: TextAlign.center,
                ),
                2.spaceH,
                Text(
                  book.authorName,
                  style: StylesConsts.f18W400grey,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
