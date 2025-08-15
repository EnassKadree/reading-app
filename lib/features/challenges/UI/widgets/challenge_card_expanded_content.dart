import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import 'challenge_book_item.dart';

class ChallengeCardExpandedContent extends StatelessWidget {
  const ChallengeCardExpandedContent({super.key, required this.challenge});
  final ChallengeModel challenge;

  @override
  Widget build(BuildContext context) {
    if (challenge.books == null || challenge.books!.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Icon(
                Iconsax.book_1,
                size: 48,
                color: Colors.grey[400],
              ),
              12.spaceH,
              Text(
                JsonConsts.noBooks.t(context),
                style: StylesConsts.f15W400Grey.copyWith(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: Colors.grey[300],
            height: 32,
          ),
          Text(JsonConsts.booksInChallenge.t(context), style: StylesConsts.f16W600Black),
          //16.spaceH,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: challenge.books!.length,
            itemBuilder: (context, index) {
              final book = challenge.books![index];
              return ChallengeBookItem(book: book, isLast: index == challenge.books!.length - 1);
            },
          ),
        ],
      ),
    );
  }
}
