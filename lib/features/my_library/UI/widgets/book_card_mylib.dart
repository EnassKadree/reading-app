import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class BookCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isLeftImage;
  const BookCard({
    super.key,
    required this.title,
    required this.icon,
    this.isLeftImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(title,
                    textAlign: TextAlign.center,
                    style: StylesConsts.introText.copyWith(
                      color: ColorsConsts.purple,
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    )),
              ],
            ),
          ),
          // صورة الكتب في الزاوية اليمنى السفلى
          Positioned(
            bottom: 0,
            left: isLeftImage ? 0 : null,
            right: isLeftImage ? null : 0,
            child: Transform(
              alignment: Alignment.center,
              transform: isLeftImage
                  ? Matrix4.rotationY(3.1416) // انعكاس أفقي
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
    );
  }
}
