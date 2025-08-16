import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/notifications/UI/widgets/notifications_header.dart';
import 'package:reading_app/features/notifications/UI/widgets/notifications_list.dart';
import 'package:reading_app/features/notifications/UI/widgets/search_field.dart';
import '../../logic/notifications_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: const SafeArea(
        child: Column(
          children: [
            // Header Section
            NotificationsHeader(),

            // Search Section
            SearchField(),

            // Notifications List
            Expanded(child: NotificationsList()),
          ],
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
          create: (context) => NotificationsCubit()..initializeNotifications(),
        ),
      ],
      child: const NotificationsScreen(),
    );
  }
}
