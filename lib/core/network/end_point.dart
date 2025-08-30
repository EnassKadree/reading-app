abstract class EndPoint {
  static const ip = '10.180.84.211';
  static const port = 8000;
  static const baseUrl = 'http://$ip:$port/api';
  static const booksBaseUrl = 'http://$ip:$port/api/mobile/books';
  static const register = '/register';
  static const login = '/login';
  static const domainName = '$ip:$port';
  //home
  static const userChallenges = '/mobile/challenge/getchallenges';
  static const categories = '/category/getCategories';
  static const authors = '/mobile/author/getAuthors';
  static const authorBooks = '/mobile/books/author-books/';
  static const mostRatedBooks = '/mobile/books/most-rated';
  static const getAllBooks = '/mobile/book/getAllBook';

  //category
  static const categoryBooks = '/mobile/books/category-books/';
  static const followCategory = '/categories/follow/';
  static const unFollowCategory = '/categories/unfollow/';

  //Mylibary /country/get-trips
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

  // CHALLENGES
  static const generalChallenges = '/challenge/getAllChallenges';
  static const joinChallenge = '/challenge/JoinToChallenge/';
  static const completedChallenges = '/challenge/getSuccessChallenge';
//BOOK DETAILS
  static const bookChallenge = '/mobile/books/GetBookChallenge/';
  static const joinBookChallenge = '/challenge/JoinToBookChallenge/';
  static const rateTheBook = '/book/RateBook/';
  static const bookComments = '/book/getBookComments/';
  static const appLink =
      "https://play.google.com/store/apps/details?id=com.example.reading_app";
  static const commentOnBook = '/book/AddCommentToTheBook/';
  static const addToRead = '/book/AddBookToDoList/';
  static const addTOFavorite = '/book/AddBookToFavorite/';
  static const removeFromFavorite = '/book/remove-from-favorites/';

  // NOTIFICATIONS
  static const allNotifications = '/notifications';
  static const markRead = '/notifications/mark/';
  static const markAllRead = '/notifications/mark-all';
  static const notificationsCount = '/notifications/unread-count';

}
