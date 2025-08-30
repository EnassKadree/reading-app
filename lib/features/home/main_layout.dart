import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/home/services/all_books/all_books_cubit.dart';
import 'package:reading_app/features/home/services/navigationBar/navigation_bar_cubit.dart';
import 'package:reading_app/features/home/view/components/navigation_bar.dart';
import 'package:reading_app/features/home/view/screens/home_wrapper.dart';
import '../challenges/UI/screens/challenges_screen.dart';
import '../community/UI/screens/community_screen.dart';
import '../my_library/UI/screens/my_library.dart';
import '../profile/UI/screens/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout(
      {super.key});


  @override
  Widget build(BuildContext context) {
    final pages = [

      const MyLibraryPage(),
      const ChallengesScreenWrapper(),
       const HomeWrapper(),
      const CommunityScreenWrapper(),
      const ProfileScreenWrapper()
    ];

    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (BuildContext context, state) {
          return pages[state];
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class MainLayoutWrapper extends StatelessWidget {
  const MainLayoutWrapper(
      {
      super.key,
      this.init});

  final int? init;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavCubit(init: init ?? 2),
          ),
          BlocProvider(create: (BuildContext context) {
            return AllBooksCubit();
          },
          ),
        ],
        child: MainLayout());
  }
}
