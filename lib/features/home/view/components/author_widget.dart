import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/author_details/view/author_details_wrapper.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';
class AuthorWidget extends StatelessWidget {
  const AuthorWidget({ required this.author,super.key});
final Author author;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Context(context).push( AuthorDetailsWrapper(author: author,));
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 90.w,
                height: 90.h,
                decoration: BoxDecoration(
                 color: context.colorScheme.secondary.withAlpha(130),
                  shape: BoxShape.circle,
                ),
              ),
              ClipOval(
                child: Container(
                  width: 90.w,
                  height: 90.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                   child:CustomNetworkImage(imageUrl: author.image)
                   //Image.asset(
                  //   "assets/images/png/Adonis.png",
                  // //  author.image,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ],
          ),
          5.spaceH,
           Text(
           author.name,
            style: StylesConsts.f16W600Black,
          )
        ],
      ).horizontalPadding,
    );
  }
}
