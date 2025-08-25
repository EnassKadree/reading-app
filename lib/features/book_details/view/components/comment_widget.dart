import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../profile/UI/widgets/profile_circle_avatar.dart';
import '../../../shared/models/comment.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({required this.comment,super.key});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileCircleAvatar(
          picture: comment.readerImage,
          height: 64.h,
        ),
        10.spaceW,
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  comment.readerName,
                  style: StylesConsts.f16W600Black.copyWith(color: context.colorScheme.primary),
                ),
                2.spaceW,
                Text(
                  comment.readerNickname,
                  style: StylesConsts.f15W400Grey.copyWith(
                    fontSize: 10.sp,
                    color: context.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            3.spaceH,
            SizedBox(
              width: 265.w,
              child: Text(
               // maxLines: 10,
               // overflow: TextOverflow.ellipsis,
                comment.comment,
                style: StylesConsts.f14W400Black,
              ),
            ),

          ],
        ),


      ],
    );
  }
}
