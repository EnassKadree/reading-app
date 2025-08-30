import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/functions/functions.dart';
import 'home_search_bar.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 350.w,
            height: 80.h,
            child: const HomeSearchBar()),
        GestureDetector(
          onTap: () {
            Functions().showSettingsDialog(context);
          },
          child: Icon(
            size: 30,
            Iconsax.menu_14,
            color:  context.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
