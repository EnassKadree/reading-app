abstract class EndPoint {
  static const baseUrl = 'https://reading-app.up.railway.app/api';
  static const domainName = 'reading-app.up.railway.app';
  static const booksBaseUrl = '$baseUrl/mobile/books';
  static const register = '/register';
  static const login = '/login';
  //home
  static const userChallenges = '/getchallenges';
  static const categories = '/category/getCategories';
  static const categoryBooks = '/mobile/books/category-books/';
  static const authors = '/mobile/author/getAuthors';
  static const authorBooks = '/mobile/books/author-books/';
  static const mostRatedBooks = '/mobile/books/most-rated';

  //Mylibary
  static const toRead = '/toread';
  static const favorites = '/favorites';
  static const inRead = '/inread';
  static const completed = '/completed';
  static const bookpdf = '/book/getBookFile/';
  static const countryBook = '/country/get-trips';
  static const bookPdf = '/book/getBookFile/';
  static const progress = '/book/update-reading-progress/';

  // PROFILE
  static const profile = '/mobile/reader/showProfile';
  static const setupProfile = '/auth/setup-profile';
  static const editProfile = '/auth/edit-profile';

  // COMMUNITY
  static const community = '/reader/getAllProfiles';

  // COMPLAINTS
  static const complaints = '/complaint/store';
  static const suggestions = '/suggestion/store';

//BOOK DETAILS
  static const bookChallenge = '/mobile/books/GetBookChallenge/';
  //
  static const appLink =
      "https://play.google.com/store/apps/details?id=com.example.reading_app";
}
