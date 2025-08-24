import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class MyLibraryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLeftImage;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const MyLibraryCard({
    super.key,
    required this.title,
    required this.icon,
    this.isLeftImage = false,
    required this.onTap,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [ColorsConsts.purple, ColorsConsts.purple.withOpacity(0.8)];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.2,
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colors[0].withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background pattern
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -15,
              left: -15,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  16.spaceH,
                  Column(
                    children: _groupWords(title).map((line) {
                      return Text(
                        line,
                        textAlign: TextAlign.center,
                        style: StylesConsts.introText.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.2,
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            // Decorative book image
            Positioned(
              bottom: 8,
              left: isLeftImage ? 8 : null,
              right: isLeftImage ? null : 8,
              child: Transform(
                alignment: Alignment.center,
                transform: isLeftImage
                    ? Matrix4.rotationY(3.1416)
                    : Matrix4.identity(),
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    AssetsConsts.booksAsset,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _groupWords(String text) {
  final shortWords = [''];
  final words = text.split(' ');
  List<String> result = [];

  int i = 0;
  while (i < words.length) {
    if (i + 1 < words.length &&
        shortWords.contains(words[i + 1].toLowerCase())) {
      if (i + 2 < words.length) {
        result.add('${words[i]} ${words[i + 1]}');
        i += 2;
      } else {
        result.add(words[i]);
        i++;
      }
    } else {
      result.add(words[i]);
      i++;
    }
  }

  return result;
}
