import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/challenges/logic/join_challenge/join_challenge_cubit.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/challenge/challenge_cubit.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key, required this.challenge});
  final ChallengeModel challenge;

  @override
  Widget build(BuildContext context) {
    return BlocListener<JoinChallengeCubit, JoinChallengeState>(
      listener: (context, state) {
        if (state is JoinChallengeSuccess &&
            state.challengeId == challenge.id) {
          context.read<ChallengeCubit>().joinChallenge(challenge.id);
        }
      },
      child: BlocBuilder<ChallengeCubit, ChallengeState>(
        builder: (context, state) {
          bool isJoined = challenge.isChallenged ||
              context.read<ChallengeCubit>().isJoined(challenge.id);

          return GestureDetector(
              onTap: () {
                if (isJoined) {
                  return;
                } else {
                  context.read<JoinChallengeCubit>().join(challenge.id);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8.r),
                      top: const Radius.circular(0)),
                  color: isJoined
                      ? context.colorScheme.surface
                      : context.colorScheme.primary,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isJoined ? Iconsax.tick_circle : Iconsax.add_circle,
                      size: 16,
                      color:
                          isJoined ? context.colorScheme.primary : Colors.white,
                    ),
                    8.spaceW,
                    Text(
                      isJoined
                          ? JsonConsts.joined.t(context)
                          : JsonConsts.join.t(context),
                      style: StylesConsts.f15W400Grey.copyWith(
                        fontSize: 12,
                        color: isJoined
                            ? context.colorScheme.primary
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
