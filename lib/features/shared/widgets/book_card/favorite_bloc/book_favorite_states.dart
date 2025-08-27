class BookFavoriteStates {
  /// Map<bookId, isFavorite>
  final Map<int, bool> favorites;

  BookFavoriteStates(this.favorites);

  factory BookFavoriteStates.initial() => BookFavoriteStates({});
}

/// Loading لكل كتاب
class LoadingFavoriteState extends BookFavoriteStates {
  final int bookId;
  final bool currentState;
  LoadingFavoriteState(this.bookId, this.currentState) : super({});
}

/// Success لكل كتاب
class SuccessFavoriteState extends BookFavoriteStates {
  final int bookId;
  final bool isFavorite;
  SuccessFavoriteState(this.bookId, this.isFavorite) : super({});
}

/// Error لكل كتاب
class ErrorFavoriteState extends BookFavoriteStates {
  final int bookId;
  final String errorMessage;
  final bool currentState;
  ErrorFavoriteState(this.bookId, this.errorMessage, this.currentState) : super({});
}