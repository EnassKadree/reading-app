import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/notifications/UI/widgets/empty_state.dart';

import '../../logic/notifications/notifications_cubit.dart';
import 'notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state.filteredNotifications.isEmpty) {
          return NotificationsEmptyState(isSearching: state.isSearching);
        }
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 20.h),
          itemCount: state.filteredNotifications.length,
          itemBuilder: (context, index) {
            final notification = state.filteredNotifications[index];
            return NotificationItem(
              notification: notification,
            ).staggerListVertical(index);
          },
        );
      },
    );
  }
}
