import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/comment.dart';

import 'comment_widget.dart';

class CommentsListSection extends StatelessWidget {
  const CommentsListSection({ required this.comments,super.key});
final List<Comment>comments;
  @override
  Widget build(BuildContext context) {
    if(comments.isNotEmpty) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, index) {
                return CommentWidget(comment: comments[index]);
              },
              separatorBuilder: (BuildContext context, index) {
                return Divider();
              },
              itemCount: comments.length)
          .horizontalPadding;
    }
    else {
      return Center(
        child: Text(JsonConsts.noCommentsYet.t(context),textAlign:TextAlign.center,style: StylesConsts.f15W400Grey,).horizontalPadding,
      );
    }
  }
}
