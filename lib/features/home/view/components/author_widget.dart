import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/author_details/view/author_details_wrapper.dart';
import 'package:reading_app/features/profile/UI/widgets/profile_circle_avatar.dart';
import 'package:reading_app/features/shared/models/author.dart';

import '../../../shared/widgets/custom_network_image.dart';
class AuthorWidget extends StatelessWidget {
  const AuthorWidget({ required this.author,super.key});
  final Author author;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Context(context).push( AuthorDetailsWrapper(author: author,));
      },
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           ProfileCircleAvatar(
             picture: author.image,
             borderColor:context.colorScheme.secondary,
             height: 100.h,
           ),
            5.spaceH,
            SizedBox(
              width: 100.w,
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  author.name,
                  overflow: TextOverflow.ellipsis,
                  style: StylesConsts.f14W400Black,
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}