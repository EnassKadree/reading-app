part of 'functions.dart';


extension Formatter on Functions {
  String formatPoints(int points) 
  {
    if (points >= 1000000) {
      return '${(points / 1000000).toStringAsFixed(1)}M';
    } else if (points >= 1000) {
      return '${(points / 1000).toStringAsFixed(0)}K';
    } else {
      return points.toString();
    }
  }
}
