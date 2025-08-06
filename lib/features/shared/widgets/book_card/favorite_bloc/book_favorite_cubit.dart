import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';

class BookFavoriteCubit extends BaseCubit<BookFavoriteStates>
{
  BookFavoriteCubit() : super(InitialFavoriteState());

 Future<void> addBookToFavorites()async
 {

 }
}

