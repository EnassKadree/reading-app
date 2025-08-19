import 'package:reading_app/features/notifications/models/notification_model.dart';

final List<NotificationModel> dummyNotifications = [
  NotificationModel(
    id: 1,
    title: 'Challenge Completed! 🎉',
    description:
        'Congratulations! You have successfully completed the "Summer Reading Challenge" and earned 150 points.',
    dateTime: DateTime.now().subtract(const Duration(minutes: 5)),
    isRead: false,
    category: 'success',
  ),
  NotificationModel(
    id: 2,
    title: 'New Book Available 📚',
    description:
        'A new book "The Great Gatsby" has been added to your favorite category. Check it out now!',
    dateTime: DateTime.now().subtract(const Duration(hours: 2)),
    isRead: false,
    category: 'info',
  ),
  NotificationModel(
    id: 3,
    title: 'Reading Reminder ⏰',
    description:
        'Don\'t forget to continue reading "To Kill a Mockingbird". You\'re making great progress!',
    dateTime: DateTime.now().subtract(const Duration(hours: 6)),
    isRead: true,
    category: 'info',
  ),
  NotificationModel(
    id: 4,
    title: 'Weekly Goal Achieved 🎯',
    description:
        'You\'ve reached your weekly reading goal of 5 books. Keep up the excellent work!',
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    isRead: true,
    category: 'success',
  ),
  NotificationModel(
    id: 5,
    title: 'Friend Challenge Invitation 👥',
    description:
        'Sarah has invited you to join the "Mystery Books Challenge". Accept the invitation to compete together!',
    dateTime: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    isRead: false,
    category: 'info',
  ),
  NotificationModel(
    id: 6,
    title: 'Reading Streak Extended 🔥',
    description:
        'Amazing! You\'ve maintained a 7-day reading streak. Your dedication is inspiring!',
    dateTime: DateTime.now().subtract(const Duration(days: 2)),
    isRead: true,
    category: 'success',
  ),
  NotificationModel(
    id: 7,
    title: 'New Achievement Unlocked 🏆',
    description:
        'You\'ve earned the "Speed Reader" badge for completing 3 books in one day!',
    dateTime: DateTime.now().subtract(const Duration(days: 3)),
    isRead: true,
    category: 'success',
  ),
  NotificationModel(
    id: 8,
    title: 'Book Recommendation 📖',
    description:
        'Based on your reading history, we think you\'ll love "1984" by George Orwell.',
    dateTime: DateTime.now().subtract(const Duration(days: 4)),
    isRead: true,
    category: 'info',
  ),
  NotificationModel(
    id: 9,
    title: 'Reading Time Update ⏱️',
    description:
        'You\'ve spent 2 hours reading today. That\'s 30 minutes more than yesterday!',
    dateTime: DateTime.now().subtract(const Duration(days: 5)),
    isRead: true,
    category: 'info',
  ),
  NotificationModel(
    id: 10,
    title: 'Community Event 🎪',
    description:
        'Join our monthly book club discussion about "The Alchemist" this Saturday at 3 PM.',
    dateTime: DateTime.now().subtract(const Duration(days: 6)),
    isRead: true,
    category: 'info',
  ),
];
