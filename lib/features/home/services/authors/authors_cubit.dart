import '../../../../core/utils/base/base_cubit.dart';
import 'authors_states.dart';

class AuthorsCubit extends BaseCubit<AuthorsStates>
{
  AuthorsCubit():super(AuthorsInitial());

  Future  getAuthors()async
  {

  }
}