import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../logic/challenge/challenge_cubit.dart';

class JoinButton extends StatelessWidget {
  const JoinButton({super.key, required this.isJoined, required this.challenge});
  final bool isJoined;
  final ChallengeModel challenge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (isJoined) {
            context.read<ChallengeCubit>().leaveChallenge(challenge.id);
          } else {
            context.read<ChallengeCubit>().joinChallenge(challenge.id);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8.r), top: const Radius.circular(0)),
            color: context.colorScheme.primary,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isJoined ? Iconsax.close_circle : Iconsax.add_circle,
                size: 16,
                color: isJoined ? Colors.red[600] : context.colorScheme.surface,
              ),
              8.spaceW,
              Text(
                isJoined ? 'Leave' : 'Join',
                style: StylesConsts.f15W400Grey.copyWith(
                  fontSize: 12,
                  color:
                      isJoined ? Colors.red[600] : context.colorScheme.surface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ));
  }
}
