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
  const MyLibraryCard({
    super.key,
    required this.title,
    required this.icon,
    this.isLeftImage = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.height * 0.2,
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorsConsts.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon, color: ColorsConsts.purple),
                  12.spaceH,
                  Column(
                    children: _groupWords(title).map((line) {
                      return Text(
                        line,
                        textAlign: TextAlign.center,
                        style: StylesConsts.introText.copyWith(
                          color: ColorsConsts.purple,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: isLeftImage ? 0 : null,
              right: isLeftImage ? null : 0,
              child: Transform(
                alignment: Alignment.center,
                transform: isLeftImage
                    ? Matrix4.rotationY(3.1416)
                    : Matrix4.identity(),
                child: Image.asset(
                  AssetsConsts.booksAsset,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
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
  final shortWords = ['in', 'to'];
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
