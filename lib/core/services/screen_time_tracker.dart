import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenTimeTracker {
  static const String _screenTimeKey = 'screen_time_';
  static const String _totalScreenTimeKey = 'total_screen_time';

  Timer? _timer;
  DateTime? _startTime;
  String? _currentBookId;

  // بدء تتبع الوقت
  void startTracking(String bookId) {
    if (_currentBookId != null && _currentBookId != bookId) {
      stopTracking();
    }

    _currentBookId = bookId;
    _startTime = DateTime.now();

    // تحديث كل دقيقة
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _updateScreenTime();
    });
  }

  // إيقاف التتبع
  void stopTracking() {
    if (_startTime != null && _currentBookId != null) {
      _updateScreenTime();
      _timer?.cancel();
      _timer = null;
      _startTime = null;
      _currentBookId = null;
    }
  }

  // تحديث وقت الشاشة
  Future<void> _updateScreenTime() async {
    if (_startTime == null || _currentBookId == null) return;

    final now = DateTime.now();
    final duration = now.difference(_startTime!);

    if (duration.inMinutes > 0) {
      await _addScreenTime(_currentBookId!, duration.inMinutes);
      _startTime = now;
    }
  }

  // إضافة وقت
  Future<void> _addScreenTime(String bookId, int minutes) async {
    final prefs = await SharedPreferences.getInstance();

    // وقت الكتاب
    final bookKey = _screenTimeKey + bookId;
    final newBookTime = (prefs.getInt(bookKey) ?? 0) + minutes;
    await prefs.setInt(bookKey, newBookTime);

    // وقت إجمالي
    final newTotalTime = (prefs.getInt(_totalScreenTimeKey) ?? 0) + minutes;
    await prefs.setInt(_totalScreenTimeKey, newTotalTime);
  }

  // الحصول على وقت الكتاب (بالدقايق)
  Future<int> getBookScreenTime(String bookId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_screenTimeKey + bookId) ?? 0;
  }

  // الحصول على الوقت الكلي (بالدقايق)
  Future<int> getTotalScreenTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_totalScreenTimeKey) ?? 0;
  }

  // تحويل الدقايق إلى ساعات (مع كسور)
  static String formatHours(int minutes) {
    return (minutes / 60).toStringAsFixed(1); // مثال: "1.5"
  }
}
