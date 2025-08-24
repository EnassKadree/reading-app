import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/services/screen_time_tracker.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/functions/functions.dart';

class SliverLibraryStats extends StatelessWidget {
  const SliverLibraryStats({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child:
            //  Container(
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.1),
            //         spreadRadius: 1,
            //         blurRadius: 10,
            //         offset: const Offset(0, 4),
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(
            //       color: ColorsConsts.purple.withOpacity(0.15),
            //       width: 1,
            //     ),
            //   ),
            //   child:
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.1),
            //         spreadRadius: 1,
            //         blurRadius: 10,
            //         offset: const Offset(0, 4),
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(20),
            //     border: Border.all(
            //       color: ColorsConsts.purple.withOpacity(0.15),
            //       width: 1,
            //     ),
            //   ),
            //   child:
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
                  "Reading Progress",
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
                    child: _buildStatItem(
                      icon: Iconsax.book_square,
                      value: Functions().formatPoints(120),
                      label: "Books discovered",
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
                            ScreenTimeTracker.formatHoursInt(minutes);

                        return _buildStatItem(
                          icon: Iconsax.timer_start,
                          value: Functions().formatPoints(formatted),
                          label: "Hours Read",
                          color: Colors.green[600]!,
                        );
                      },
                    ),
                  ),
                  16.spaceW,
                  Expanded(
                    child: _buildStatItem(
                      icon: Iconsax.star,
                      value: "4.2",
                      label: "Avg   Rating",
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

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        //   decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(
        //         color: color.withOpacity(0.1),
        //         blurRadius: 8,
        //         offset: const Offset(0, 4),
        //         spreadRadius: 1,
        //       ),
        //     ],
        //     color: Colors.white.withOpacity(0.7).withOpacity(0.1),
        //     borderRadius: BorderRadius.circular(12),
        //     border: Border.all(
        //       color: color.withOpacity(0.2),
        //       width: 1,
        //     ),
        //   ),
        //   child:
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 25,
              ),
            ),
            8.spaceH,
            Text(
              value,
              style: StylesConsts.f16W600Black.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        // ),
        8.spaceH,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Text(
            label,
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
