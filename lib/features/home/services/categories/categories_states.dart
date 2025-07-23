
import '../../../shared/models/category.dart';

abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class CategoriesLoading extends CategoriesStates {}

class CategoriesSuccess extends CategoriesStates {
  final List<CategoryModel> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesError extends CategoriesStates {
  final String errorMessage;
  CategoriesError(this.errorMessage);
}
