import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';

class NotificationsEmptyState extends StatelessWidget {
  const NotificationsEmptyState({super.key, required this.isSearching});
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Iconsax.notification,
              size: 64,
              color: Colors.grey[400],
            ),
          ),
          24.spaceH,
          Text(
            isSearching
                ? JsonConsts.noNotificationsFound.t(context)
                : JsonConsts.noNotificationsYet.t(context),
            style: StylesConsts.f18W600Black.copyWith(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          8.spaceH,
          Text(
            isSearching
                ? JsonConsts.tryAdjustSearch.t(context)
                : JsonConsts.youLlSeeNotifications.t(context),
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 14,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
