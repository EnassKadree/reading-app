abstract class BookFavoriteStates
{}
class InitialFavoriteState extends BookFavoriteStates{}
class IsFavoriteState extends BookFavoriteStates{
bool isFavorite;
IsFavoriteState(this.isFavorite);
}