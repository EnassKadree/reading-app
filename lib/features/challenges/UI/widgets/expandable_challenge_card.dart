import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/challenges/UI/widgets/challenge_card_expanded_content.dart';
import 'package:reading_app/features/challenges/UI/widgets/challenge_card_header.dart';
import 'package:reading_app/features/challenges/UI/widgets/join_button.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';
import 'package:reading_app/features/shared/widgets/custom_white_container.dart';
import '../../logic/challenge/challenge_cubit.dart';

class ExpandableChallengeCard extends StatelessWidget {
  final ChallengeModel challenge;
  final bool joinEnabled;

  const ExpandableChallengeCard({
    super.key,
    required this.challenge, this.joinEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeCubit, ChallengeState>(
      builder: (context, state) {
        final isExpanded =
            context.read<ChallengeCubit>().isExpanded(challenge.id);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomWhiteContainer(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    // Header section (always visible)
                    ChallengeCardHeader(
                        challenge: challenge, isExpanded: isExpanded),

                    // Expandable content
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: ChallengeCardExpandedContent(
                        challenge: challenge,
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
              joinEnabled ? 
              JoinButton(
                challenge: challenge,
              ) : 0.spaceH
            ],
          ),
        );
      },
    );
  }
}
