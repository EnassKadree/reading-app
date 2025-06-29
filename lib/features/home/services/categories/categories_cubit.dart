import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates>
{
  CategoriesCubit():super(CategoriesInitial());
  Future  getCategories()async
  {

  }
}