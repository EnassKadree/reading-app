import 'package:flutter_bloc/flutter_bloc.dart';
import 'books_states.dart';
class BooksCubit extends Cubit<BooksStates>
{
  BooksCubit():super(BooksInitial());
  Future  getBooks()async
  {

  }
}