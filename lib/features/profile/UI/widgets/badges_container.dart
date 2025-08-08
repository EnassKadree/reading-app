import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class BadgesContainer extends StatelessWidget {
  const BadgesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.medal,
                    color: Colors.amber[400],
                    size: 24,
                  ),
                  12.spaceW,
                  Text(
                    'Achievements (${badges.length})',
                    style: StylesConsts.f18W600Black.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                'more..',
                style: StylesConsts.f15W400Grey.copyWith(
                  fontSize: 14,
                  color: Colors.blue[400],
                ),
              ),
            ],
          ),
          20.spaceH,
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: badges.length,
              itemBuilder: (context, index) {
                final badge = badges[index];
                return _buildBadgeItem(context, badge);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(BuildContext context, BadgeItem badge) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: badge.isUnlocked ? badge.color : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: badge.isUnlocked
                      ? badge.color.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Background pattern for unlocked badges
                if (badge.isUnlocked)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: badge.color.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                // Main icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: badge.isUnlocked
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      badge.icon,
                      color: badge.isUnlocked ? badge.color : Colors.grey[400],
                      size: 24,
                    ),
                  ),
                ),
                // Decorative element for unlocked badges
                if (badge.isUnlocked)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: badge.color.withOpacity(0.7),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          8.spaceH,
          Text(
            badge.name,
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: badge.isUnlocked ? badge.color : Colors.grey[400],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BadgeItem {
  final String name;
  final IconData icon;
  final Color color;
  final bool isUnlocked;

  BadgeItem({
    required this.name,
    required this.icon,
    required this.color,
    required this.isUnlocked,
  });
}

final List<BadgeItem> badges = [
  BadgeItem(
    name: 'First Book',
    icon: Iconsax.book,
    color: Colors.pink[400]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Speed Reader',
    icon: Iconsax.timer,
    color: Colors.blue[400]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Bookworm',
    icon: Iconsax.book_square,
    color: Colors.yellow[600]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Global Explorer',
    icon: Iconsax.global,
    color: Colors.purple[400]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Challenge Master',
    icon: Iconsax.medal,
    color: Colors.red[400]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Streak Keeper',
    icon: Iconsax.star,
    color: Colors.amber[400]!,
    isUnlocked: true,
  ),
  BadgeItem(
    name: 'Night Owl',
    icon: Iconsax.moon,
    color: Colors.indigo[400]!,
    isUnlocked: false,
  ),
  BadgeItem(
    name: 'Early Bird',
    icon: Iconsax.sun,
    color: Colors.orange[400]!,
    isUnlocked: false,
  ),
  BadgeItem(
    name: 'Social Reader',
    icon: Iconsax.people,
    color: Colors.green[400]!,
    isUnlocked: false,
  ),
];
