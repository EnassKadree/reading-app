abstract class FollowUnFollowCategoryStates {
  bool isFollowed;

  FollowUnFollowCategoryStates(this.isFollowed);
}

class FollowUnFollowCategoryInitial extends FollowUnFollowCategoryStates {
  FollowUnFollowCategoryInitial(super.isFollowed);
}

class FollowUnFollowCategorySuccess extends FollowUnFollowCategoryStates {
  FollowUnFollowCategorySuccess(super.isFollowed);
}

class FollowUnFollowCategoryLoading extends FollowUnFollowCategoryStates {
  FollowUnFollowCategoryLoading(super.isFollowed);
}

class FollowUnFollowCategoryError extends FollowUnFollowCategoryStates {
  String errorMessage;

  FollowUnFollowCategoryError(this.errorMessage, bool isFollowed) : super(isFollowed);
}
