import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/models/challenge_model.dart';

part 'challenge_state.dart';

class ChallengeCubit extends BaseCubit<ChallengeState> {
  ChallengeCubit() : super(const ChallengeState());

  void loadJoinedChallenges(List<ChallengeModel> challenges) {
    Map<int, bool> temp = {};
    for (final challenge in challenges) {
      temp[challenge.id] = challenge.isChallenged;
    }
    print('--------------------------my state-----------------------');
    print(temp.toString());
    emit(state.copyWith(joinedChallenges: temp));
  }

  void toggleExpanded(int challengeId) {
    final currentExpandedChallenges = List<int>.from(state.expandedChallenges);

    if (currentExpandedChallenges.contains(challengeId)) {
      currentExpandedChallenges.remove(challengeId);
    } else {
      currentExpandedChallenges.add(challengeId);
    }

    emit(state.copyWith(expandedChallenges: currentExpandedChallenges));
  }

  void joinChallenge(int challengeId) {
    final currentJoinedChallenges = Map<int, bool>.from(state.joinedChallenges);
    currentJoinedChallenges[challengeId] = true;
    emit(state.copyWith(joinedChallenges: currentJoinedChallenges));
    print('-------------------change');
    print(state.joinedChallenges);
  }

  bool isExpanded(int challengeId) {
    return state.expandedChallenges.contains(challengeId);
  }

  bool isJoined(int challengeId) {
    return state.joinedChallenges[challengeId] == true;
  }
}
