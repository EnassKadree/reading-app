import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/challenges/logic/completed_challenges/completed_challenges_cubit.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';
import 'package:reading_app/features/shared/widgets/something_went_wrong.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/lists/dummy_challenges.dart';
import 'expandable_challenge_card.dart';
import 'challenges_empty_state.dart';

class CompletedChallengesTab extends StatelessWidget {
  const CompletedChallengesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedChallengesCubit, CompletedChallengesState>(
      builder: (context, state) {
        if (state is CompletedChallengesFailure) {
          return Center(
            child: SomeThingWentWrongWidget(onPressed: () {
              context.read<CompletedChallengesCubit>().get();
            }),
          );
        }

        final List<ChallengeModel> data = state is CompletedChallengesSuccess
            ? state.challenges
            : dummyChallenges;

        // Show empty state if no completed challenges available
        if (data.isEmpty) {
          return ChallengesEmptyState(
            isCompletedChallenges: true,
            onRefresh: () {
              context.read<CompletedChallengesCubit>().get();
            },
          );
        }

        return Skeletonizer(
          enabled: state is CompletedChallengesLoading,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16.h),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final challenge = data[index];
              return ExpandableChallengeCard(
                challenge: challenge,
                joinEnabled: false,
              ).staggerListVertical(index);
            },
          ),
        );
      },
    );
  }
}
