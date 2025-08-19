
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors_consts.dart';
import '../../../../core/utils/constants/shadows_consts.dart';
import 'custom_clipper.dart';


class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({
    super.key, this.height,
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack
    (
      children: 
      [
        AnimatedContainer
        (
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          height: height,
          width: double.infinity, 
          child: ClipPath
          (
            clipper: CustomCurveClipper(),
            child: Container
            (
              // constraints: BoxConstraints
              // (
              //   maxHeight: MediaQuery.of(context).size.height *.75
              // ),
              height: height,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration
              (
                boxShadow: ShadowsConsts.sm,
                gradient: const LinearGradient
                (
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ColorsConsts.gradientColors
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}