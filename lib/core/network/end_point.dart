abstract class EndPoint {
  static const baseUrl = 'http://192.168.0.110:8000/api';
  static const booksBaseUrl = 'http://192.168.0.110:8000/api/mobile/books';
   static const register = '/register';
  static const login = '/login';
  static const domainName = 'reading-app.up.railway.app';
  //home
  static const userChallenges ='/mobile/challenge/getchallenges';
  static const categories = '/category/getCategories';
  static const authors='/mobile/author/getAuthors';
  static const authorBooks='/mobile/books/author-books/';
  static const mostRatedBooks='/mobile/books/most-rated';


  //category
  static const categoryBooks='/mobile/books/category-books/';
  static const followCategory='/categories/follow/';
  static const unFollowCategory='/categories/unfollow/';

  //Mylibary 
  static const toRead = '/toread';
  static const favorites = '/favorites';
  static const inRead = '/inread';
  static const completed = '/completed';
  static const bookpdf = '/book/getBookFile/';
  static const countryBook = '/country/get-trips';
  static const bookPdf = '/book/getBookFile/';
  static const bookInfo = '/book/getReaderBookInfo';
  static const progress = '/book/update-reading-progress/';

  // PROFILE
  static const profile = '/reader/showProfile';
  static const setupProfile = '/auth/setup-profile';
  static const editProfile = '/auth/edit-profile';

  // COMMUNITY
  static const community = '/reader/getAllProfiles';

  // COMPLAINTS
  static const complaints = '/complaint/store';
  static const suggestions = '/suggestion/store';

//BOOK DETAILS
  static const bookChallenge= '/mobile/books/GetBookChallenge/';
  static const joinBookChallenge='/challenge/JoinToBookChallenge/';
 static const rateTheBook='/book/RateBook/';
 static const bookComments='/book/getBookComments/';
  static const appLink= "https://play.google.com/store/apps/details?id=com.example.reading_app";
   static const commentOnBook='/book/AddCommentToTheBook/';
   static const addToRead='/book/AddBookToDoList/';
   static const  addTOFavorite='/book/AddBookToFavorite/';
  static const  removeFromFavorite='/book/remove-from-favorites/';
}
