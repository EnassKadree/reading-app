import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
         color: context.colorScheme.secondary.withAlpha(150),
          child: SizedBox(
              child: Lottie.asset("assets/images/lottie/book_loading.json" , width: 50,
                height: 50,),),


     );
  }
}
