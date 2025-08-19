import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../services/navigationBar/navigation_bar_cubit.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (index) => context.read<BottomNavCubit>().updateTab(index),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.archive_book),
                label: JsonConsts.library.t(context)),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.cup),
                label: JsonConsts.challenges.t(context)),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.home_2,),
                backgroundColor: context.colorScheme.primary,
                label: JsonConsts.home.t(context)),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.profile_2user),
                label: JsonConsts.community.t(context)),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.user_octagon),
                label: JsonConsts.profile.t(context)),
          ],
        );
      },
    );
  }
}
