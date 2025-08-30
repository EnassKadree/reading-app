import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';

import '../../../../core/lists/dummy_profile.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/profile_model.dart';
import '../../logic/community/community_cubit.dart';
import 'list_tile_card.dart';

class ProfilesList extends StatelessWidget {
  const ProfilesList({super.key, required this.state});
  final CommunityState state;

  @override
  Widget build(BuildContext context) {
    return _buildProfilesList(context, state);
  }
}

Widget _buildProfilesList(BuildContext context, CommunityState state) {
  if (state is CommunitySuccess) {
    final cubit = context.read<CommunityCubit>();

    // Determine which list to show based on search state
    List<ProfileModel> displayProfiles =
        state.isSearching ? state.filteredProfiles : state.profiles;

    // Show search results count if searching
    if (state.isSearching) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${JsonConsts.searchResults.t(context)}: ${state.filteredProfiles.length}',
                  style: StylesConsts.f14W600Black.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                TextButton.icon(
                  onPressed: () => cubit.clearSearch(),
                  icon: const Icon(Iconsax.close_circle, size: 16),
                  label: Text(JsonConsts.clear.t(context)),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[600],
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                ),
              ],
            ),
          ),
          8.spaceH,
          if (state.filteredProfiles.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(
                    Iconsax.search_status,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  16.spaceH,
                  Text(
                    JsonConsts.noResults.t(context),
                    style: StylesConsts.f16W600Black.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          else
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.filteredProfiles.length,
              itemBuilder: (context, index) {
                return ListTileCard(
                  index: index + 1,
                  profile: state.filteredProfiles[index],
                  isArranged: false, // Always false when searching
                ).staggerListVertical(index);
              },
            ),
        ],
      );
    }

    // Show all profiles when not searching
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: displayProfiles.length,
      itemBuilder: (context, index) {
        return ListTileCard(
          index: index + 1,
          profile: displayProfiles[index],
          isArranged: cubit.isArranged,
        );
      },
    );
  }

  // Fallback for other states
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: dummyProfileList.length,
    itemBuilder: (context, index) {
      return ListTileCard(
        index: index + 1,
        profile: dummyProfileList[index],
        isArranged: true,
      );
    },
  );
}
