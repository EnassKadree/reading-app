part of 'challenge_cubit.dart';

class ChallengeState {
  final List<int> expandedChallenges;
  final List<int> joinedChallenges;

  const ChallengeState({
    this.expandedChallenges = const [],
    this.joinedChallenges = const [],
  });

  ChallengeState copyWith({
    List<int>? expandedChallenges,
    List<int>? joinedChallenges,
  }) {
    return ChallengeState(
      expandedChallenges: expandedChallenges ?? this.expandedChallenges,
      joinedChallenges: joinedChallenges ?? this.joinedChallenges,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChallengeState &&
        other.expandedChallenges == expandedChallenges &&
        other.joinedChallenges == joinedChallenges;
  }

  @override
  int get hashCode {
    return expandedChallenges.hashCode ^ joinedChallenges.hashCode;
  }
}
