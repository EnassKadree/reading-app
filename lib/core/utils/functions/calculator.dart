part of 'functions.dart';


extension Calculator on Functions {
  String timeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);

  if (diff.inSeconds < 60) {
    return "just now";
  } else if (diff.inMinutes < 60) {
    final m = diff.inMinutes;
    return m == 1 ? "1 minute ago" : "$m minutes ago";
  } else if (diff.inHours < 24) {
    final h = diff.inHours;
    return h == 1 ? "1 hour ago" : "$h hours ago";
  } else if (diff.inDays < 7) {
    final d = diff.inDays;
    return d == 1 ? "1 day ago" : "$d days ago";
  } else if (diff.inDays < 30) {
    final w = (diff.inDays / 7).floor();
    return w == 1 ? "1 week ago" : "$w weeks ago";
  } else if (diff.inDays < 365) {
    final mo = (diff.inDays / 30).floor();
    return mo == 1 ? "1 month ago" : "$mo months ago";
  } else {
    final y = (diff.inDays / 365).floor();
    return y == 1 ? "1 year ago" : "$y years ago";
  }
}

}
