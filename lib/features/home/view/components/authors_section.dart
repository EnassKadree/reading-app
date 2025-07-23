import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/services/authors/authors_cubit.dart';
import 'package:reading_app/features/home/services/authors/authors_states.dart';
import 'package:reading_app/features/home/view/components/author_widget.dart';
import 'package:reading_app/features/shared/models/author.dart';
import 'package:reading_app/features/shared/widgets/loading_screen.dart';

class AuthorsSection extends StatelessWidget {
  const AuthorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          JsonConsts.authors.t(context),
          style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
        ).verticalPadding.horizontalPadding,
        BlocBuilder<AuthorsCubit, AuthorsStates>(
          builder: (BuildContext context, AuthorsStates state) {
            if (state is AuthorsSuccess) {
              List<Author> authors = state.authors;
              return SizedBox(
                height: 120.h,
                child: AnimationLimiter(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: authors.length,
                    itemBuilder: (BuildContext context, index) {
                      return AuthorWidget(
                        author:authors[index]
                      ).staggerListVertical(index);
                    },
                  ),
                ),
              );
            } else if (state is AuthorsLoading) {
              return const LoadingScreen();
            }
            else {
              return Container(
                width: 200,
                height: 10,
                color: Colors.redAccent,
              );
            }
          },
        ),
      ],
    );
  }
}
