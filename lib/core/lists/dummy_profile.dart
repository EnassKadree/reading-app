import 'package:reading_app/features/shared/models/profile_model.dart';
import 'package:reading_app/features/shared/models/badge_model.dart';

final ProfileModel dummyProfile = ProfileModel(
  firstName: '',
  lastName: '',
  picture: '',
  nickname: '',
  bio: '',
  quote: '',
  booksNumber: 0,
  countriesNumber: 0,
  challengesNumber: 0,
  totalPoints: 0,
  badges: [
    BadgeModel(
      title: '',
      icon: '',
    ),
    BadgeModel(
      title: '',
      icon: '',
    ),
    BadgeModel(
      title: '',
      icon: '',
    ),
  ],
);

final List<ProfileModel> dummyProfileList = [
  ProfileModel(
    firstName: '',
    lastName: '',
    picture: '',
    nickname: '',
    bio: '',
    quote: '',
    booksNumber: 0,
    countriesNumber: 0,
    challengesNumber: 0,
    totalPoints: 0,
    badges: [
      BadgeModel(
        title: '',
        icon: '',
      ),
      BadgeModel(
        title: '',
        icon: '',
      ),
    ],
  ),
  ProfileModel(
    firstName: '',
    lastName: '',
    picture: '',
    nickname: '',
    bio: '',
    quote: '',
    booksNumber: 0,
    countriesNumber: 0,
    challengesNumber: 0,
    totalPoints: 0,
    badges: [
      BadgeModel(
        title: '',
        icon: '',
      ),
    ],
  ),
];
