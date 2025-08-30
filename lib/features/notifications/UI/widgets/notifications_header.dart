import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/notifications/logic/mark_as_read/mark_as_read_cubit.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/notifications/notifications_cubit.dart';

class NotificationsHeader extends StatelessWidget {
  const NotificationsHeader({super.key, required this.unreadCount});
  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.isDarkMode
                    ? Colors.black26
                    : Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.notification,
                size: 28,
                color: Colors.purple[800]!,
              ),
              16.spaceW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      JsonConsts.notifications.t(context),
                      style: StylesConsts.f18W600Black.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (unreadCount > 0) ...[
                      4.spaceH,
                      Text(
                        '$unreadCount ${JsonConsts.unReadNotifications.t(context)}',
                        style: StylesConsts.f15W400Grey.copyWith(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  context.read<MarkAsReadCubit>().markAll();
                  context
                      .read<NotificationsCubit>()
                      .markAllNotificationsAsRead();
                },
                child: Column(
                  children: [
                    const Icon(
                      size: 20,
                      Iconsax.tick_circle,
                      color: Colors.blue,
                    ),
                    6.spaceH,
                    Text(
                      'mark all read',
                      style: StylesConsts.descTxt.copyWith(fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
