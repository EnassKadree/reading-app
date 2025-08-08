import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/profile/UI/widgets/stats_container.dart';
import 'package:reading_app/features/profile/UI/widgets/badges_container.dart';

import '../../../../core/utils/functions/functions.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_surface_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: Functions().staggeredList([
                  ProfileSurfaceContainer(
                    icon: Icon(
                      Iconsax.quote_down,
                      color: Colors.blue[400],
                      size: 24,
                    ),
                    title: JsonConsts.favoriteQuote.t(context),
                    desc:
                        'If you really want something, the whole universe will conspire to help you achieve it',
                    isItalic: true,
                  ),
                  24.spaceH,
                  ProfileSurfaceContainer(
                      icon: Icon(
                        Iconsax.user,
                        color: Colors.purple[400],
                        size: 24,
                      ),
                      title: JsonConsts.bio.t(context),
                      desc:
                          'Passionate book lover and avid reader. I believe in the power of stories to transform lives and connect people across cultures.'),
                  24.spaceH,
                  const StatsContainer(),
                  24.spaceH,
                  const BadgesContainer(),
                  32.spaceH,
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
