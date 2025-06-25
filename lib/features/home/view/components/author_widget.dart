import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/author.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({ required this.author,super.key});
final Author author;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
               color: context.colorScheme.secondary.withAlpha(130),
                shape: BoxShape.circle,
              ),
            ),
            ClipOval(
              child: Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  author.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        5.spaceH,
         Text(
         author.name,
          style: StylesConsts.f16W600Black,
        )
      ],
    ).horizontalPadding;
  }
}
