import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/lists/dummy_comments.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/auth/UI/widgets/custom_text_form_field.dart';
import 'package:reading_app/features/book_details/view/components/comments_list_section.dart';
import 'package:reading_app/features/profile/UI/widgets/setup_profile_form.dart';
import 'package:reading_app/features/profile/UI/widgets/setup_profile_form_field.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../service/book_comments/book_comments_cubit.dart';
import '../../service/book_comments/book_comments_states.dart';

class CommentsSection extends StatelessWidget {
   CommentsSection({super.key});
final TextEditingController commentController=TextEditingController();
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
                              Column(
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(vertical: 30.h),
                                      height: 0.6.sh,
                                      child: CommentsListSection(
                                          comments: dummyComments),
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                      width: 0.8.sw,
                                      child:SetupProfileFormField(controller: commentController, hint: "comment", icon: Icons.add_card))   ],
                              ),
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
              Container(
                width: 1.sw,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height:170.h,
                      child: (state is SuccessBookCommentsStates)
                          ? CommentsListSection(
                              comments: (state.comments.isNotEmpty)
                                  ? state.comments.sublist(0, 3)
                                  : [])
                          : Skeletonizer(
                              child: CommentsListSection(comments: dummyComments),
                            ),
                    ),
                    TextButton(onPressed: (){
                      Functions().showSheet(
                        context,
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 30.h),
                              height: 0.7.sh,
                              child: CommentsListSection(
                                  comments: dummyComments),
                            ),
                            SizedBox(
                                height: 40.h,
                                width: 0.8.sw,
                                child:SetupProfileFormField(controller: commentController, hint: "comment", icon: Icons.add_card))   ],
                        ),
                      );}, child: Text("Add a Comment",style: StylesConsts.f20W600Yellow.copyWith(color: context.colorScheme.primary,fontSize: 17.sp),))

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
