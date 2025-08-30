import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/lists/dummy_notifications.dart';
import 'package:reading_app/features/notifications/UI/widgets/notifications_header.dart';
import 'package:reading_app/features/notifications/UI/widgets/notifications_list.dart';
import 'package:reading_app/features/notifications/UI/widgets/search_field.dart';
import 'package:reading_app/features/notifications/logic/all_notifications/all_notifications_cubit.dart';
import 'package:reading_app/features/notifications/logic/mark_as_read/mark_as_read_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../logic/notifications/notifications_cubit.dart';
import '../../logic/notifications_count/notifications_count_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) => context.read<NotificationsCountCubit>().get(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AllNotificationsCubit, AllNotificationsState>(
            listener: (context, state) {
              if (state is AllNotificationsSuccess) {
                context
                    .read<NotificationsCubit>()
                    .initializeNotifications(state.notifications.notifications);
              }
            },
            builder: (context, state) {
              final data = state is AllNotificationsSuccess
                  ? state.notifications
                  : dummyNotificationsResponse;
              return Skeletonizer(
                enabled: state is AllNotificationsLoading,
                child: Column(
                  children: [
                    // Header Section
                    NotificationsHeader(
                      unreadCount: data.unreadCount,
                    ),

                    // Search Section
                    const SearchField(),

                    // Notifications List
                    const Expanded(child: NotificationsList()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NotificationsScreenWrapper extends StatelessWidget {
  const NotificationsScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NotificationsCubit()..initializeNotifications(dummyNotifications),
        ),
        BlocProvider(
          create: (context) => AllNotificationsCubit()..get(),
        ),
        BlocProvider(
          create: (context) => MarkAsReadCubit(),
        ),
      ],
      child: const NotificationsScreen(),
    );
  }
}
