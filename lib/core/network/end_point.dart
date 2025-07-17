abstract class EndPoint {
  static const baseUrl =
      'https://reading-app-laravel-production.up.railway.app/api';

  static const booksBaseUrl =
      'https://reading-app-laravel-production.up.railway.app/api/mobile/books';
  //AUTH
  static const register = '/register';
  static const login = '/login';
  //Mylibary /book/getBookFile
  static const toRead = '/toread';
  static const favorites = '/favorites';
  static const inRead = '/inread';
  static const completed = '/completed';
   static const bookpdf = '/book/getBookFile/';
}
