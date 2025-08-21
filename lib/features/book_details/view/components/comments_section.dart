
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_comments.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/comment_widget.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/comment.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({ super.key});

  @override
  Widget build(BuildContext context) {
    List<Comment>comments=dummyComments;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        textAlign: TextAlign.start,
            JsonConsts.commentOnThisBook.t(context),
        style: StylesConsts.f24BoldBlack,
      ).horizontalPadding,

  Container(
    height: 400.h,
    child: ListView.separated(itemBuilder: (BuildContext context, index) {
      return CommentWidget(comment: comments[index]);
      },
      separatorBuilder:(BuildContext context, index){return Divider();},
      itemCount: comments.length),
  ).horizontalPadding
    ],
    );
  }
}
