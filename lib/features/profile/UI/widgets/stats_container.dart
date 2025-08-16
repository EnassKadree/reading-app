import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/models/profile_model.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key, required this.profile});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
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
            children: [
              Icon(
                Iconsax.chart,
                color: Colors.orange[400],
                size: 24,
              ),
              12.spaceW,
              Text(
                JsonConsts.readingStats.t(context),
                style: StylesConsts.f18W600Black.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          24.spaceH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(context, JsonConsts.books.t(context),
                  profile.booksNumber, Iconsax.book, Colors.blue),
              _buildStatItem(context, JsonConsts.countries.t(context),
                  profile.countriesNumber, Iconsax.global, Colors.green),
              _buildStatItem(context, JsonConsts.challenges.t(context),
                  profile.challengesNumber, Iconsax.medal, Colors.purple),
              _buildStatItem(context, JsonConsts.points.t(context),
                  profile.totalPoints, Iconsax.star, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, int value,
      IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color.withOpacity(.7),
            size: 24,
          ),
        ),
        8.spaceH,
        Text(
          value.toString(),
          style: StylesConsts.f18W600Black.copyWith(
              fontSize: 20, fontWeight: FontWeight.bold, color: color),
        ),
        4.spaceH,
        Text(
          label,
          style: StylesConsts.f15W400Grey.copyWith(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
