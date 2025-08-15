import 'package:reading_app/features/shared/models/challenge_model.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/models/category.dart';

final List<ChallengeModel> dummyChallenges = [
  ChallengeModel(
    id: 1,
    title: 'Summer Reading Challenge',
    description:
        'Read 5 books during the summer months and earn bonus points for completing this seasonal challenge.',
    pointsEarned: 150,
    duration: 90,
    numberOfBooks: 5,
    sizeCategoryName: 'Medium Books',
    category: CategoryModel(
      id: 1,
      name: 'Fiction',
      icon: '📚',
      isFollowed: false,
    ),
    books: [
      BookModel(
        id: 1,
        title: 'The Great Gatsby',
        description: 'A classic American novel about the Jazz Age.',
        authorName: 'F. Scott Fitzgerald',
        countryFlag: '🇺🇸',
        publishDate: '1925-04-10',
        coverImage:
            'https://i.pinimg.com/736x/9c/1e/bc/9c1ebc72742d8575f6b10f5164b79ed1.jpg',
        starRate: 4.5,
        readersCount: 1000,
        categoryName: 'Fiction',
        sizeCategoryName: 'Medium Books',
        numberOfPages: 180,
        isFavourite: false,
        isInLibrary: false,
      ),
      BookModel(
        id: 2,
        title: 'To Kill a Mockingbird',
        description:
            'A powerful story about racial injustice in the American South.',
        authorName: 'Harper Lee',
        countryFlag: '🇺🇸',
        publishDate: '1960-07-11',
        coverImage:
            'https://i.pinimg.com/736x/8c/52/2a/8c522ade8654961d3c0fc0e9743d8ee1.jpg',
        starRate: 4.8,
        readersCount: 1200,
        categoryName: 'Fiction',
        sizeCategoryName: 'Medium Books',
        numberOfPages: 281,
        isFavourite: false,
        isInLibrary: false,
      ),
    ],
  ),
  ChallengeModel(
    id: 2,
    title: 'Science Fiction Marathon',
    description:
        'Dive into the world of science fiction with this 3-book challenge featuring classic and modern works.',
    pointsEarned: 200,
    duration: 60,
    numberOfBooks: 3,
    sizeCategoryName: 'Big Books',
    category: CategoryModel(
      id: 2,
      name: 'Science Fiction',
      icon: '🚀',
      isFollowed: false,
    ),
    books: [
      BookModel(
        id: 3,
        title: 'Dune',
        description:
            'An epic science fiction novel set on the desert planet Arrakis.',
        authorName: 'Frank Herbert',
        countryFlag: '🇺🇸',
        publishDate: '1965-08-01',
        coverImage:
            'https://i.pinimg.com/736x/08/f1/26/08f12648289b7b3a42d3a30a3bd604a7.jpg',
        starRate: 4.7,
        readersCount: 800,
        categoryName: 'Science Fiction',
        sizeCategoryName: 'Big Books',
        numberOfPages: 688,
        isFavourite: false,
        isInLibrary: false,
      ),
    ],
  ),
  ChallengeModel(
    id: 3,
    title: 'Quick Reads Challenge',
    description:
        'Perfect for busy readers! Complete 4 short books in just 30 days.',
    pointsEarned: 100,
    duration: 30,
    numberOfBooks: 4,
    sizeCategoryName: 'Small Books',
    category: CategoryModel(
      id: 3,
      name: 'Short Stories',
      icon: '📖',
      isFollowed: false,
    ),
    books: null, // No books specified for this challenge
  ),
  ChallengeModel(
    id: 4,
    title: 'Historical Fiction Journey',
    description:
        'Travel through time with these carefully selected historical fiction novels.',
    pointsEarned: 175,
    duration: 75,
    numberOfBooks: 3,
    sizeCategoryName: null, // No size category specified
    category: CategoryModel(
      id: 4,
      name: 'Historical Fiction',
      icon: '🏛️',
      isFollowed: false,
    ),
    books: [
      BookModel(
        id: 4,
        title: 'The Book Thief',
        description: 'A story set in Nazi Germany narrated by Death.',
        authorName: 'Markus Zusak',
        countryFlag: '🇦🇺',
        publishDate: '2005-09-14',
        coverImage:
            'https://i.pinimg.com/736x/b7/d1/32/b7d132d9591b535b86a47febf6f390e3.jpg',
        starRate: 4.6,
        readersCount: 950,
        categoryName: 'Historical Fiction',
        sizeCategoryName: 'Medium Books',
        numberOfPages: 584,
        isFavourite: false,
        isInLibrary: false,
      ),
      BookModel(
        id: 5,
        title: 'All the Light We Cannot See',
        description:
            'A Pulitzer Prize-winning novel about a blind French girl and a German boy.',
        authorName: 'Anthony Doerr',
        countryFlag: '🇺🇸',
        publishDate: '2014-05-06',
        coverImage:
            'https://i.pinimg.com/736x/b7/a7/91/b7a791c6ffdf1f3b39a21a0682888628.jpg',
        starRate: 4.4,
        readersCount: 750,
        categoryName: 'Historical Fiction',
        sizeCategoryName: 'Big Books',
        numberOfPages: 544,
        isFavourite: false,
        isInLibrary: false,
      ),
    ],
  ),
  ChallengeModel(
    id: 5,
    title: 'Mystery & Thriller Challenge',
    description:
        'Solve mysteries and experience thrilling adventures with this 4-book challenge.',
    pointsEarned: 125,
    duration: 45,
    numberOfBooks: 4,
    sizeCategoryName: null,
    category: null, // No category specified
    books: null, // No books specified
  ),
];
