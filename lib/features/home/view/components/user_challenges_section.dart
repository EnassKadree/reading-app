import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/active_challenges/user_challenges_cubit.dart';
import 'package:reading_app/features/home/services/active_challenges/user_challenges_states.dart';
import 'package:reading_app/features/home/view/components/user_challenge_card.dart';
import 'package:reading_app/features/shared/models/user_challenge.dart';

class UserChallengesSection extends StatelessWidget {
  const UserChallengesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserChallengesCubit, UserChallengesStates>(
      builder: (BuildContext context, UserChallengesStates state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
             if (state  is UserChallengeSuccess)
               {
                 List<UserChallenge>userChallenges=state.userChallenges;
                 if(userChallenges.isNotEmpty) {
                   return  ActiveChallengeCard(userChallenge: UserChallenge(percentage :30,title: "Art challenge",points: 100,description: "mmmmm",timeLeft: 3,id: 5));
                 }
                 else {
                   return Container();
                 }
               }
           else {
               return  ActiveChallengeCard(userChallenge: UserChallenge(percentage :30,title: "Art challenge",points: 100,description: "mmmmm",timeLeft: 3,id: 5));
             }

            },
            itemCount: 4);
      },
    );
  }
}
