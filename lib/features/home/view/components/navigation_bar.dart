import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import '../../services/navigationBar/navigation_bar_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          unselectedItemColor: context.colorScheme.surfaceContainer.withAlpha(100),
          selectedItemColor:  context.colorScheme.surfaceContainer,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: state,
          onTap: (index) => context.read<BottomNavCubit>().updateTab(index),
          items: [
            BottomNavigationBarItem( backgroundColor:context.colorScheme.primary,icon: const Icon(Iconsax.home), label: ""),
             BottomNavigationBarItem(backgroundColor:context.colorScheme.primary,icon: Icon(Iconsax.book_square), label: "."),
             BottomNavigationBarItem(backgroundColor:context.colorScheme.primary,icon: Icon(Iconsax.medal), label: ".."),
             BottomNavigationBarItem(backgroundColor:context.colorScheme.primary,icon: Icon(Iconsax.people), label: "...."),
              BottomNavigationBarItem(backgroundColor:context.colorScheme.primary,icon: Icon(Iconsax.profile_add), label: "..."),

          ],
        );
      },
    );
  }
}

