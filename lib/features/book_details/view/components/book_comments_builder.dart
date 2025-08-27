import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_comments.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/service/comment_on_book/comment_on_book_cubit.dart';
import 'package:reading_app/features/book_details/view/components/add_a_comment_button.dart';
import 'package:reading_app/features/book_details/view/components/book_details_white_container.dart';
import 'package:reading_app/features/book_details/view/components/bottom_sheet_content.dart';
import 'package:reading_app/features/book_details/view/components/cant_rate_or_comment.dart';
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
        required this.parentContext,
      super.key});

  final int bookId;
  final int currentPage;
  final int bookPages;
  final BuildContext parentContext;
  @override
  Widget build(BuildContext context) {
    bool canComment = ((currentPage * 100) / bookPages) > 70;
    return BlocConsumer<BookCommentsCubit, BookCommentsStates>(
      builder: (BuildContext context, BookCommentsStates state) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Comments',
                    style: StylesConsts.f24BoldBlack
                  ),
                  if (state is SuccessBookCommentsStates)
                    if (state.comments.isNotEmpty && state.comments.length >3)
                      GestureDetector(
                        onTap: () {
                          Functions().showSheet(
                              context,

                              BottomSheetContent(
                                  canComment: canComment,
                                  comments: state.comments,
                                  bookId: bookId)

                          );
                        },
                        child: Text(
                          textAlign: TextAlign.end,
                          'View All',
                          style: StylesConsts.f20W600Yellow.copyWith(
                            fontSize: 14.sp
                          ),
                        ),
                      ).horizontalPadding
                ],
              ),
              15.spaceH,
              BookDetailsWhiteContainer(
                maxHeight: 280.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 170.h,
                      child: (state is SuccessBookCommentsStates)
                          ? CommentsListSection(
                              comments: (state.comments.isNotEmpty)
                                  ? ((state.comments.length >= 3)
                                      ? state.comments.sublist(0, 3)
                                      : state.comments)
                                  : []
                      )
                          : Skeletonizer(
                              child:
                                  CommentsListSection(comments: dummyComments),
                            ),
                    ),
                    if (!canComment)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20.w),
                        child: AddACommentButton(function: (){
                          Functions().showSheet(
                          parentContext,
                          BottomSheetContent(
                            canComment: !canComment,
                            comments: (state is SuccessBookCommentsStates)
                                ? state.comments
                                : [],
                            bookId: bookId,
                          ),

                          );}),
                      )
                    else
                      const CantRateOrComment(
                        cantString:
                            "Can't comment until you've read 70% of the book",
                      ).mainPadding,
                  ],
                ),
              ),
              20.spaceH,
            ],
          ),
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
