import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_comments.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/bottom_sheet_content.dart';
import 'package:reading_app/features/book_details/view/components/comments_list_section.dart';
import 'package:reading_app/features/shared/widgets/custom_white_container.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../service/book_comments/book_comments_cubit.dart';
import '../../service/book_comments/book_comments_states.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection(
      {required this.currentPage,
      required this.bookPages,
      required this.bookId,
      super.key});

  final int bookId;
  final int currentPage;
  final int bookPages;

  @override
  Widget build(BuildContext context) {
    bool canComment = ((currentPage * 100) / bookPages) > 70;
    return BlocConsumer<BookCommentsCubit, BookCommentsStates>(
      builder: (BuildContext context, BookCommentsStates state) {
        return SizedBox(
          child: Column(
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
                              BottomSheetContent(
                                  canComment: canComment,
                                  comments: state.comments,
                                  bookId: bookId));
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
              CustomWhiteContainer(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180.h,
                      child: (state is SuccessBookCommentsStates)
                          ? CommentsListSection(
                              comments: (state.comments.isNotEmpty)
                                  ? ((state.comments.length >= 3)
                                      ? state.comments.sublist(0, 3)
                                      : state.comments)
                                  : [])
                          : Skeletonizer(
                              child:
                                  CommentsListSection(comments: dummyComments),
                            ),
                    ),
                    (canComment)
                        ? TextButton(
                            onPressed: () {
                              Functions().showSheet(
                                  context,
                                  BottomSheetContent(
                                    canComment: canComment,
                                    comments:
                                        (state is SuccessBookCommentsStates)
                                            ? state.comments
                                            : [],
                                    bookId: bookId,
                                  ));
                            },
                            child: Text(
                              "Add a Comment",
                              style: StylesConsts.f20W600Yellow.copyWith(
                                  color: context.colorScheme.primary,
                                  fontSize: 17.sp),
                            ),
                          )
                        : Text(
                            "can't comment on the book until reading 70% of it",
                            style: StylesConsts.f20W600Yellow.copyWith(
                                color: context.colorScheme.primary,
                                fontSize: 10.sp),
                          ).mainPadding
                  ],
                ),
              ),
              20.spaceH,
            ],
          ).horizontalPadding,
        );
      },
      listener: (BuildContext context, BookCommentsStates state) {
        if (state is ErrorBookCommentsStates) {
          Functions().showSnackBar(context, state.errorMessage);
        }
      },
    );
  }
}
