import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/services/screen_time_tracker.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/my_library/UI/widgets/my_library_body/build_stat_item.dart';

class SliverLibraryStats extends StatelessWidget {
  const SliverLibraryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsConsts.purple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Iconsax.status_up,
                    color: ColorsConsts.purple,
                    size: 20,
                  ),
                ),
                12.spaceW,
                Text(
                  JsonConsts.readingProgress.t(context),
                  style: StylesConsts.f16W600Black.copyWith(
                    color: ColorsConsts.purple,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            //   ),
            18.spaceH,
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorsConsts.purple.withOpacity(0.15),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: buildStatItem(
                      icon: Iconsax.book_square,
                      value: Functions().formatPoints(120),
                      label: JsonConsts.booksDiscovered.t(context),
                      color: Colors.blue[600]!,
                    ),
                  ),
                  16.spaceW,
                  Expanded(
                    child: FutureBuilder<int>(
                      future: ScreenTimeTracker().getTotalScreenTime(),
                      builder: (context, snapshot) {
                        final minutes = snapshot.data ?? 0;
                        final formatted =
                            ScreenTimeTracker.formatHours(minutes);

                        return buildStatItem(
                          icon: Iconsax.timer_start,
                          value: formatted,
                          label: JsonConsts.hoursRead.t(context),
                          color: Colors.pink[300]!,
                        );
                      },
                    ),
                  ),
                  16.spaceW,
                  Expanded(
                    child: buildStatItem(
                      icon: Iconsax.star,
                      value: "4.2",
                      label: JsonConsts.avgRating.t(context),
                      color: Colors.amber[600]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //   ),
    );
  }
}
