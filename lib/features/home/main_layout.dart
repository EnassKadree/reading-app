import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/challenges/challenges_screen.dart';
import 'package:reading_app/features/home/services/navigationBar/navigation_bar_cubit.dart';
import 'package:reading_app/features/home/view/components/navigation_bar.dart';
import 'package:reading_app/features/home/view/home_wrapper.dart';
import 'package:reading_app/features/profile/UI/screens/profile_screen.dart';
import '../community/UI/screens/community_screen.dart';
import '../my_library/UI/screens/my_library.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  static const _pages = [
    MyLibraryPage(),
    ChallengesScreen(),
    HomeWrapper(),
    CommunityScreenWrapper(),
    ProfileScreenWrapper()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (BuildContext context, state) {
          return _pages[state];
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class MainLayoutWrapper extends StatelessWidget {
  const MainLayoutWrapper({super.key, this.init});
  final int? init;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => BottomNavCubit(init: init ?? 2),
      ),
    ], child: const MainLayout());
  }
}
