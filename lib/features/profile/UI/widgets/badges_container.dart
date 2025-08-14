import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/shared/models/badge_model.dart';
import 'package:reading_app/features/shared/widgets/custom_network_image.dart';

import '../../../../core/utils/constants/styles_consts.dart';

class BadgesContainer extends StatelessWidget {
  const BadgesContainer({super.key, required this.badges});
  final List<BadgeModel> badges;

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
                    JsonConsts.badges.t(context),
                    style: StylesConsts.f18W600Black.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          20.spaceH,
          badges.isNotEmpty
              ? SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: badges.length,
                    itemBuilder: (context, index) {
                      final badge = badges[index];
                      return _buildBadgeItem(context, badge);
                    },
                  ),
                )
              : Center(
                  child: Text(JsonConsts.noData.t(context)),
                ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(BuildContext context, BadgeModel badge) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CustomNetworkImage(imageUrl: badge.icon)),
          8.spaceH,
          Text(
            badge.title,
            style: StylesConsts.f15W400Grey.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
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
