
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/features/author_details/service/author_books_cubit.dart';
import 'package:reading_app/features/author_details/service/author_books_states.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/widgets/books_grid.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/lists/dummy_books.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/widgets/book_card/book_card.dart';

class AuthorBooksSection extends StatelessWidget {
  const AuthorBooksSection({ required this .authorId,super.key});
 final int authorId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorBooksCubit, AuthorBooksStates>(
      builder: (BuildContext context, AuthorBooksStates state) {
        if (state is AuthorBooksSuccess) {
          List<BookModel>books= state.authorBooks;
          return BooksGrid(books:  books);
        }
        else if (state is AuthorBooksLoading)
          {
            List<BookModel>books=dummyBook ;
            return BooksGrid(books:  books,loading: true,);
          }
        else {
        return SliverToBoxAdapter(child: SizedBox(child:  Center(
          child: Text(
            JsonConsts.thereAreNoBooksCurrently.t(context),
            style: StylesConsts.f18W600Black.copyWith(color: context.colorScheme.primary),
          ),
        ),));
      }
    },
      listener:(BuildContext context, AuthorBooksStates state) {
        if(state is AuthorBooksError) {
          showCustomErrorDialog(context: context, message: state.errorMessage, onPressed: (){
            context.read<AuthorBooksCubit>().getAuthorBooks(authorId);
          });
        }
      }

    );
  }


}
