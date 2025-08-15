import '../../../../core/utils/base/base_cubit.dart';

part 'challenge_state.dart';

class ChallengeCubit extends BaseCubit<ChallengeState> {
  ChallengeCubit() : super(const ChallengeState());

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
    final currentJoinedChallenges = List<int>.from(state.joinedChallenges);

    if (!currentJoinedChallenges.contains(challengeId)) {
      currentJoinedChallenges.add(challengeId);
      emit(state.copyWith(joinedChallenges: currentJoinedChallenges));
    }
  }

  void leaveChallenge(int challengeId) {
    final currentJoinedChallenges = List<int>.from(state.joinedChallenges);

    if (currentJoinedChallenges.contains(challengeId)) {
      currentJoinedChallenges.remove(challengeId);
      emit(state.copyWith(joinedChallenges: currentJoinedChallenges));
    }
  }

  bool isExpanded(int challengeId) {
    return state.expandedChallenges.contains(challengeId);
  }

  bool isJoined(int challengeId) {
    return state.joinedChallenges.contains(challengeId);
  }
}
