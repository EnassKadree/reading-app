abstract class EndPoint
{
  static const baseUrl = 'https://reading-app.up.railway.app/api';
  static const booksBaseUrl = 'https://reading-app.up.railway.app/api/mobile/books';
  static const register = '/register';
  static const login = '/login';
  //home
  static const userChallenges ='/getchallenges';
  static const categories = '/category/getCategories';
  static const categoryBooks='/mobile/books/category-books/';
  static const authors='/mobile/author/getAuthors';
  static const authorBooks='/mobile/books/author-books/';
  static const mostRatedBooks='/mobile/books/most-rated';

  //Mylibary /country/get-trips
  static const toRead = '/toread';
  static const favorites = '/favorites';
  static const inRead = '/inread';
  static const completed = '/completed';
   static const bookPdf = '/book/getBookFile/';
   static const countryBook = '/country/get-trips';

//BOOK DETAILS
  static const bookChallenge= '/mobile/books/GetBookChallenge/';
   //
  static const appLink= "https://play.google.com/store/apps/details?id=com.example.reading_app";


}
