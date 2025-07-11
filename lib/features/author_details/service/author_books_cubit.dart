
import '../../../../core/utils/base/base_cubit.dart';
import 'author_books_states.dart';

class AuthorBooksCubit extends BaseCubit<AuthorBooksStates>
{
  AuthorBooksCubit():super(AuthorBooksInitial());

  Future  getAuthorBooks()async
  {

  }
}