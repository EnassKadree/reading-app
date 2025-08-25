import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/book_details/service/book_comments/book_comments_cubit.dart';
import 'package:reading_app/features/book_details/service/comment_on_book/comment_on_book_cubit.dart';
import 'package:reading_app/features/book_details/service/comment_on_book/comment_on_book_states.dart';
import 'package:reading_app/features/shared/models/comment.dart';

import '../../../../core/lists/dummy_comments.dart';
import '../../../profile/UI/widgets/setup_profile_form_field.dart';
import '../../service/book_comments/book_comments_states.dart';
import 'comments_list_section.dart';

class BottomSheetContent extends StatelessWidget {
  BottomSheetContent({required this.bookId, required this.comments, super.key});

  final TextEditingController commentController = TextEditingController();
   List<Comment> comments;
  final int bookId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context) {
          return CommentOnBookCubit();
        },),
        BlocProvider(
          create: (BuildContext context) {
            return BookCommentsCubit();
          },),
      ],
        child: Column(
          children: [
            BlocBuilder<BookCommentsCubit,BookCommentsStates>(
                builder: (  context,BookCommentsStates state) {
                  if(state is SuccessBookCommentsStates) {
                    comments=state.comments;
                  }
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  height: 0.7.sh,
                  child: CommentsListSection(comments:comments),
                );
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 60.h,
                    width: 0.7.sw,
                    child: SetupProfileFormField(
                      maxLines: 6,
                        controller: commentController,
                        hint: "comment",
                        icon: Icons.add_card)),
                BlocConsumer<CommentOnBookCubit,CommentOnBookStates>(
                    builder: (  context,CommentOnBookStates state) {
                      if(state is LoadingCommentOnBookStates) {
                      return CircularProgressIndicator(
                        color: context.colorScheme.primary,
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<CommentOnBookCubit>()
                              .commentOnBook(bookId, commentController.text);
                          context.read<BookCommentsCubit>().getBookComments(bookId);
                          commentController.clear();
                        },
                        child: const Icon(Iconsax.send_14),
                      );
                    }
                  }
                  ,listener: (  context,CommentOnBookStates state){
                      if(state is ErrorCommentOnBookStates) {
                      Functions().showSnackBar(context, state.errorMessage);
                    }
                  },
                )
              ],
            )
          ],
        ),
      );
  }
}
