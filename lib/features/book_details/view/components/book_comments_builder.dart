import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_comments.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/comments_list_section.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../service/book_comments/book_comments_cubit.dart';
import '../../service/book_comments/book_comments_states.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookCommentsCubit, BookCommentsStates>(
      builder: (BuildContext context, BookCommentsStates state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  JsonConsts.commentOnThisBook.t(context),
                  style: StylesConsts.f24BoldBlack,
                ),
                if (state is SuccessBookCommentsStates)
                  if (state.comments.isNotEmpty && state.comments.length > 3)
                    GestureDetector(
                      onTap: () {
                        Functions().showSheet(
                            context,
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 30.h),
                                height: 200.h,
                                child: CommentsListSection(
                                    comments: dummyComments)));
                      },
                      child: Text(
                        JsonConsts.viewAll.t(context),
                        style: StylesConsts.f20W600Yellow
                            .copyWith(fontSize: 15.sp),
                      ),
                    )
              ],
            ).horizontalPadding,
            10.spaceH,
            Container(
                width: 1.sw,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: context.colorScheme.surfaceContainer,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 7,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    (state is SuccessBookCommentsStates)
                        ? CommentsListSection(comments: state.comments)
                        : Skeletonizer(
                            child: CommentsListSection(comments: dummyComments),),

                  ],
                ),),
          ],
        ).horizontalPadding;
      },
      listener: (BuildContext context, BookCommentsStates state) {
        if (state is ErrorBookCommentsStates) {
          Functions().showSnackBar(context, state.errorMessage);
        }
      },
    );
  }
}
