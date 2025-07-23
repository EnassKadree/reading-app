abstract class EndPoint
{
  static const baseUrl = 'https://reading-app-laravel-production.up.railway.app/api';
  static const register = '/register';
  static const login = '/login';
  //home
  static const userChallenges ='/getchallenges';
  static const categories = '/category/getCategories';
  static const categoryBooks='/mobile/books/category-books/';
  static const authors='/mobile/author/getAuthors';
  static const mostRatedBooks='/mobile/books/most-rated';
  //Mylibary /country/get-trips
  static const toRead = '/toread';
  static const favorites = '/favorites';
  static const inRead = '/inread';
  static const completed = '/completed';
   static const bookpdf = '/book/getBookFile/';
   static const countryBook = '/country/get-trips';
}
