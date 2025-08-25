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
   const CommentsSection({ required this.bookId,super.key});
   final int bookId;
  @override
  Widget build(BuildContext context) {
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
                             BottomSheetContent(comments: state.comments,bookId: bookId,)
                          );
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
                      height:170.h,
                      child: (state is SuccessBookCommentsStates)
                          ? CommentsListSection(
                              comments: (state.comments.isNotEmpty)
                                  ?( (state.comments.length>=3)?state.comments.sublist(0, 3):state.comments)
                                  : []
                      )
                          : Skeletonizer(
                              child: CommentsListSection(comments: dummyComments),
                            ),
                    ),
                    TextButton(
                        onPressed: (){
                      Functions().showSheet(
                        context,
                       BottomSheetContent(comments: (state is SuccessBookCommentsStates)?state.comments:[],bookId: bookId,)
                      );
                      }, child: Text("Add a Comment",style: StylesConsts.f20W600Yellow.copyWith(color: context.colorScheme.primary,fontSize: 17.sp),))

                  ],
                ),
              ),
              20.spaceH,
              // Center(
              //   child: GestureDetector(
              //       onTap: () {},
              //       child: Container(
              //           padding: EdgeInsets.symmetric(horizontal: 5.w),
              //           height: 30.h,
              //           width: 260.w,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: context.colorScheme.primary.withAlpha(120),
              //                 spreadRadius: 1,
              //                 blurRadius: 1,
              //               ),
              //             ],
              //             border: Border.all(
              //                 color: context.colorScheme.primary, width: 1.7),
              //             borderRadius: BorderRadius.circular(15.r),
              //           ),
              //           child: Center(
              //                   child: Text('Add a Comment ',
              //                       style: StylesConsts.f18W600White))
              //               .horizontalPadding)),
              // ),
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
