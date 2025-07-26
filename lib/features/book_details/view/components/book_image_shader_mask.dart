import 'package:flutter/material.dart';

class BookImageShaderMask extends StatelessWidget {
  const BookImageShaderMask({super.key});

  @override
  Widget build(BuildContext context) {
    return     ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.05),
          ],
          stops: [0.4,0.9],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        'assets/images/png/book 1.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
