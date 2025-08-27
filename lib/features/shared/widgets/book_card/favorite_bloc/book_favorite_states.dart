abstract class BookFavoriteStates
{
  bool isFavorite;
  BookFavoriteStates(this.isFavorite);
}
class InitialFavoriteState extends BookFavoriteStates{
  InitialFavoriteState(super.isFavorite);
}
class SuccessFavoriteState extends BookFavoriteStates{
  SuccessFavoriteState(super.isFavorite);
}
class LoadingFavoriteState extends BookFavoriteStates{
  LoadingFavoriteState(super.isFavorite);
}
class ErrorFavoriteState extends BookFavoriteStates{
  String errorMessage;

  ErrorFavoriteState(this.errorMessage,bool isFavorite):super(isFavorite);
}


