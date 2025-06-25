import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/home/view/components/user_challenges_section.dart';
import '../../../../core/utils/constants/json_consts.dart';

class HomePurpleContainer extends StatelessWidget {
  const HomePurpleContainer({required this.searchController, super.key});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            JsonConsts.activeChallenges.t(context),
             style:StylesConsts.f30W500White,
             textAlign: TextAlign.start,
           ).horizontalPadding,
          5.spaceH,
          const SizedBox(
            height: 130,
            child: UserChallengesSection(),
          ).verticalPadding,
          10.spaceH,
        ],
      ),
    );
  }
}
