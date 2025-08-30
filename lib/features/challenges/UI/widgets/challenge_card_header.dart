import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/challenge/challenge_cubit.dart';
import 'challenge_stat_item.dart';

class ChallengeCardHeader extends StatelessWidget {
  const ChallengeCardHeader(
      {super.key, required this.challenge, required this.isExpanded});
  final ChallengeModel challenge;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          challenge.title,
                          style: StylesConsts.f16W600Black.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colorScheme.primary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<ChallengeCubit>()
                                .toggleExpanded(challenge.id);
                          },
                          child: AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Iconsax.arrow_down_1,
                                color: Colors.blue[600],
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    8.spaceH,
                    Text(
                      challenge.description,
                      style: StylesConsts.f15W400Grey.copyWith(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          16.spaceH,

          // Challenge stats
          Row(
            children: [
              ChallengeStatItem(
                icon: Iconsax.star,
                text: '${challenge.points} ${JsonConsts.pts.t(context)}',
                color: Colors.amber[600]!,
              ),
              24.spaceW,
              ChallengeStatItem(
                icon: Iconsax.clock,
                text: '${challenge.duration} ${JsonConsts.days.t(context)}',
                color: Colors.blue[600]!,
              ),
              24.spaceW,
              ChallengeStatItem(
                icon: Iconsax.book,
                text: '${challenge.numberOfBooks} ${JsonConsts.books.t(context)}',
                color: Colors.green[600]!,
              ),
            ],
          ),

          // Category and size category info
          if (challenge.category != null ||
              challenge.sizeCategoryName != null) ...[
            16.spaceH,
            Row(
              children: [
                if (challenge.category != null) ...[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.category,
                          size: 16,
                          color: Colors.purple[600],
                        ),
                        6.spaceW,
                        Text(
                          challenge.category!.name,
                          style: StylesConsts.f15W400Grey.copyWith(
                            fontSize: 12,
                            color: Colors.purple[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                if (challenge.category != null &&
                    challenge.sizeCategoryName != null) ...[
                  12.spaceW,
                ],
                if (challenge.sizeCategoryName != null) ...[
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.ruler,
                          size: 16,
                          color: Colors.orange[600],
                        ),
                        6.spaceW,
                        Text(
                          challenge.sizeCategoryName!,
                          style: StylesConsts.f15W400Grey.copyWith(
                            fontSize: 12,
                            color: Colors.orange[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
