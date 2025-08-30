import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/challenges/UI/widgets/completed_challenges_tab.dart';
import 'package:reading_app/features/challenges/UI/widgets/general_challenges_tab.dart';
import 'package:reading_app/features/challenges/logic/completed_challenges/completed_challenges_cubit.dart';
import 'package:reading_app/features/challenges/logic/general_challenges/general_challenges_cubit.dart';
import 'package:reading_app/features/challenges/logic/join_challenge/join_challenge_cubit.dart';
import 'package:reading_app/features/complaints/UI/widgets/custom_tab_bar.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../logic/challenge/challenge_cubit.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChallengeCubit(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          children: [
            64.spaceH,
            CustomTabBar(tabs: [
              Tab(text: JsonConsts.general.t(context)),
              Tab(text: JsonConsts.completed.t(context)),
            ]).verticalPadding.staggerListVertical(0),
            const Expanded(
                child: TabBarView(children: [
              GeneralChallengesTab(),
              CompletedChallengesTab()
            ]))
          ],
        )),
      ),
    );
  }
}

class ChallengesScreenWrapper extends StatelessWidget {
  const ChallengesScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeneralChallengesCubit()..get(),
        ),
        BlocProvider(
          create: (context) => CompletedChallengesCubit()..get(),
        ),
        BlocProvider(
          create: (context) => JoinChallengeCubit(),
        ),
      ],
      child: const ChallengesScreen(),
    );
  }
}
