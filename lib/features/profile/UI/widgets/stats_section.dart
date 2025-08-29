import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
// import 'package:reading_app/core/utils/extensions/context_extension.dart';
// import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

// import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/profile_model.dart';
import 'stat_item.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key, required this.profile});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    List<StatItem> stats = [
      StatItem(
        icon: Iconsax.book,
        label: JsonConsts.books.t(context),
        color: Colors.blue[600]!,
        value: profile.booksNumber,
      ),
      StatItem(
        icon: Iconsax.global,
        label: JsonConsts.countries.t(context),
        color: Colors.pink[300]!,
        value: profile.countriesNumber,
      ),
      StatItem(
        icon: Iconsax.medal,
        label: JsonConsts.challenges.t(context),
        color: Colors.amber[600]!,
        value: profile.challengesNumber,
      ),
      StatItem(
        icon: Iconsax.star,
        label: JsonConsts.points.t(context),
        color: Colors.purpleAccent,
        value: profile.totalPoints,
      ),
    ];
    final double width = MediaQuery.of(context).size.width;
    final bool isNarrow = width < 360;
    final double aspect = isNarrow ? 1.3 : 1.4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.chart,
              color: Colors.pink[300]!,
              size: 18,
            ),
            12.spaceW,
            Text(
              JsonConsts.readingStats.t(context),
              style: StylesConsts.f18W600Black.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        8.spaceH,
        GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: aspect,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return SlideAnimation(
                verticalOffset: 20,
                child: FadeInAnimation(
                  child: stats[index].staggeredGrid(index),
                ),
              );
            }),
      ],
    );
  }
}
