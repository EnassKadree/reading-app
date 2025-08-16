
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../core/utils/constants/json_consts.dart';
import 'custom_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.desc,
  });
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.linear,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.clamp(0.0, 1.0),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Success Icon with Animation
                    Transform.scale(
                      scale: value.clamp(0.0, 1.0),
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withOpacity(.5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.tick_circle,
                          size: 50,
                          color: context.colorScheme.surface.withOpacity(.8),
                        ),
                      ),
                    ),

                    24.spaceH,

                    // Success Title
                    Transform.translate(
                      offset: Offset(0, 30 * (1 - value.clamp(0.0, 1.0))),
                      child: Opacity(
                        opacity: value.clamp(0.0, 1.0),
                        child: Text(
                          JsonConsts.suggestionSentSuccessfully.t(context),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: context.colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    16.spaceH,

                    // Thank You Message
                    Transform.translate(
                      offset: Offset(0, 30 * (1 - value.clamp(0.0, 1.0))),
                      child: Opacity(
                        opacity: value.clamp(0.0, 1.0),
                        child: Text(
                          desc,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    32.spaceH,

                    // Close Button
                    Transform.scale(
                      scale: value.clamp(0.0, 1.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            title: JsonConsts.ok.t(context),
                            onPressed: () {
                              context.pop();
                            },
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
