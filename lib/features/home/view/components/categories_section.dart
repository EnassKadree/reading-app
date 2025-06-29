import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/services/categories/categories_cubit.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';
import 'package:reading_app/features/home/view/components/icon_text_widget.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          JsonConsts.categories.t(context),
          style: StylesConsts.f18W600Black.copyWith(fontSize: 23),
        ).mainPadding,
        BlocBuilder<CategoriesCubit, CategoriesStates>(
          builder: (BuildContext context, CategoriesStates state) {
            return SizedBox(
              height: 35.h,
              child: AnimationLimiter(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return const IconTextWidget(text: "Sports", icon: Icons.sports_basketball,margin: 16,).staggerListVertical(index);
                    },

                    itemCount: 15),
              ),
            );
          },
        ),
      ],
    );
  }
}
