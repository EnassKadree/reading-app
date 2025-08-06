import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          width: 1.sw,
          height: 1.sh,
          color: context.colorScheme.surfaceContainer,
        ),
        Container(
             width: 1.sw,
            height: 1.sh,
            color:context.colorScheme.secondary.withAlpha(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h,width: 150.w,
                    child: Lottie.asset("assets/images/lottie/book_loading.json", width: 50, height: 50,)),
              ],
            ),
        ),
      ],
    );
  }
}
