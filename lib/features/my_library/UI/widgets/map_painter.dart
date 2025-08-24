import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  final Map<String, Path> countryPaths;
  final Map<String, int> highlightedCountries;

  final Map<String, Color> assignedColors;
  final bool isDarkMode;
  MapPainter({
    required this.countryPaths,
    required this.highlightedCountries,
    required this.assignedColors,
    required this.isDarkMode,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final scaleX = size.width / 1000;
    final scaleY = size.height / 500;
    final matrix4 = Matrix4.identity()..scale(scaleX, scaleY);

    for (final entry in countryPaths.entries) {
      final path = entry.value.transform(matrix4.storage);
      final isHighlighted = highlightedCountries.containsKey(entry.key);

      paint.color = isHighlighted
          ? assignedColors[entry.key] ?? Colors.orange
          : isDarkMode
              ? Colors.grey
              : Colors.grey[300]!;

      canvas.drawPath(path, paint);

      if (isHighlighted) {
        final count = highlightedCountries[entry.key]!;
        final bounds = path.getBounds();
        final center = bounds.center;

        final textPainter = TextPainter(
          text: TextSpan(
            text: '$count',
            style: const TextStyle(
              fontSize: 5,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        textPainter.paint(
          canvas,
          center - Offset(textPainter.width / 2, textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
