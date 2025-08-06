import 'package:flutter/material.dart';

import '../../../shared/widgets/custom_network_image.dart';

class BookImageShaderMask extends StatelessWidget {
  const BookImageShaderMask({ required this.bookImage,super.key});
 final String bookImage;
  @override
  Widget build(BuildContext context) {
    return     ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.02),
          ],
          stops: const [0.4,0.9],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: CustomNetworkImage(
        imageUrl: bookImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      )
    );
  }
}
