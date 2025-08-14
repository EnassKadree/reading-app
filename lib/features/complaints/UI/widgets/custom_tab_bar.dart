import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/widgets/custom_white_container.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
  });
  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 56.h,
        child: Stack(
          children: [
            CustomWhiteContainer(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: TabBar(
                  indicatorAnimation: TabIndicatorAnimation.elastic,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.zero,
                  tabs: tabs),
            ),
            const Center(
              child: VerticalDivider(
                indent: 9,
                endIndent: 9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
