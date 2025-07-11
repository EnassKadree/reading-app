import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class TwoSectionsInfos extends StatelessWidget {
  const TwoSectionsInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_pin,
            color: context.colorScheme.surfaceContainer,
          ).mainPadding,
          Text(
            "Syria",
            style: StylesConsts.f18W600Black
                .copyWith(color: context.colorScheme.surfaceContainer),
          ),
          20.spaceW,
          VerticalDivider(
            color: context.colorScheme.surfaceContainer,
            thickness: 3,
          ).mainPadding,
          20.spaceW,
          Icon(
            Icons.menu_book_outlined,
            color: context.colorScheme.surfaceContainer,
          ),
          Text(
            "1200",
            style: StylesConsts.f18W600Black
                .copyWith(color: context.colorScheme.surfaceContainer),
          ).mainPadding,
        ],
      ),
    ).mainPadding;
  }
}
