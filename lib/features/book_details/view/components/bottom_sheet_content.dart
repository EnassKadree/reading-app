import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/shared/models/comment.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';
import '../../service/book_comments/book_comments_cubit.dart';
import '../../service/book_comments/book_comments_states.dart';
import '../../service/comment_on_book/comment_on_book_cubit.dart';
import '../../service/comment_on_book/comment_on_book_states.dart';
import 'comments_list_section.dart';

class BottomSheetContent extends StatefulWidget {
   BottomSheetContent(
      { required this.canComment,required this.bookId, required this.comments, super.key});

   List<Comment> comments;
   final int bookId;
   final bool canComment;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
          child: Column(
            children: [
              BlocConsumer<BookCommentsCubit, BookCommentsStates>(
                  builder: (context, BookCommentsStates commentsState) {
                    if (commentsState is SuccessBookCommentsStates) {
                      widget.comments = commentsState.comments;
                    }
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      height: 0.7.sh,
                      child: CommentsListSection(
                          comments:
                              (commentsState is SuccessBookCommentsStates)
                                  ? commentsState.comments
                                  : widget.comments),
                    );
                  },
                  listener: (context, BookCommentsStates commentsState) {}),
              Visibility(
                visible: (widget.canComment),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        height: 60.h,
                        width: 0.7.sw,
                        child: SetupProfileFormField(
                            maxLines: 6,
                            controller: commentController,
                            hint: "comment",
                            icon: Iconsax.message_text_1)),
                    BlocConsumer<CommentOnBookCubit, CommentOnBookStates>(
                      builder: (context, CommentOnBookStates state) {
                        if (state is LoadingCommentOnBookStates) {
                          return CircularProgressIndicator(
                            color: context.colorScheme.primary,
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              context.read<CommentOnBookCubit>().commentOnBook(
                                  widget.bookId, commentController.text);
                            },
                            child: const Icon(Iconsax.send_14),
                          );
                        }
                      },
                      listener: (context, CommentOnBookStates state) {
                        if (state is ErrorCommentOnBookStates) {
                          Functions().showSnackBar(context, state.errorMessage);
                        }
                        if(state is SuccessCommentOnBookStates)
                          {
                            context
                                .read<BookCommentsCubit>()
                                .getBookComments(widget.bookId);
                            commentController.clear();
                          }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
    )
    ;
  }
}
