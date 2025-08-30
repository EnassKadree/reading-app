import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/notifications/logic/mark_as_read/mark_as_read_cubit.dart';
import '../../../shared/models/notification_model.dart';
import '../../logic/notifications/notifications_cubit.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    Color color = _getTypeColor(context, notification.type);
    IconData icon = _getTypeIcon(notification.type);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: notification.isRead
            ? context.theme.scaffoldBackgroundColor
            : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: notification.isRead
              ? Colors.grey.withOpacity(.2)
              : color.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: notification.isRead
                ? Colors.grey.withOpacity(0.05)
                : color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Dismissible(
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: color.withOpacity(.1),
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(
            Iconsax.tick_circle,
            color: Colors.grey,
          ),
        ),
        key: ValueKey(notification.id + (notification.isRead ? '_read' : '')),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) async {
          context
              .read<NotificationsCubit>()
              .markNotificationAsRead(notification.id);
          context.read<MarkAsReadCubit>().mark(notification.id);
        },
        confirmDismiss: (direction) async {
          if (notification.isRead) {
            return false;
          }
          // Prevent actual dismissal
          return true;
        },
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: color.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 24,
                  ),
                ),

                16.spaceW,

                // Notification Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: StylesConsts.f16W600Black.copyWith(
                                  fontSize: 15,
                                  fontWeight: notification.isRead
                                      ? FontWeight.w500
                                      : FontWeight.w600,
                                  color: notification.isRead
                                      ? Colors.grey[700]
                                      : context.colorScheme.onSurface),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (!notification.isRead) ...[
                            8.spaceW,
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                      8.spaceH,
                      Text(
                        notification.description,
                        style: StylesConsts.f15W400Grey.copyWith(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      12.spaceH,
                      Row(
                        children: [
                          Icon(
                            Iconsax.clock,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          6.spaceW,
                          Text(
                            Functions().timeAgo(notification.createdAt),
                            style: StylesConsts.f15W400Grey.copyWith(
                              fontSize: 11,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: color.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              notification.category,
                              style: StylesConsts.f15W400Grey.copyWith(
                                fontSize: 10,
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(BuildContext context, String? type) {
    switch (type) {
      case 'success':
        return Colors.purple[700]!;
      case 'info':
      default:
        return Colors.blue[600]!;
    }
  }

  IconData _getTypeIcon(String? type) {
    switch (type) {
      case 'success':
        return Iconsax.tick_circle;
      case 'info':
      default:
        return Iconsax.info_circle;
    }
  }
}
