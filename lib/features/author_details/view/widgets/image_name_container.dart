import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../shared/models/author.dart';

class ImageNameContainer extends StatelessWidget {
  const ImageNameContainer({required this.author,super.key});
  final Author author;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      height: 250.h,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: Container(
        height: 220.h,
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.all(
            Radius.circular(40.r),
          ),
        ),
        child: Row(
           children: [
             30.spaceW,
            Stack(
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary.withAlpha(130),
                    shape: BoxShape.circle,
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    decoration:  const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: author.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>  Image.asset("assets/images/png/Adonis.png"),

                    ),
                  ),
                ),
              ],
            ), ],
        ),
      ),
    );
  }
}
