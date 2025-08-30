import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/functions.dart';
import 'package:reading_app/features/my_library/services/country_book_count/country_book_count_cubit.dart';

class SliverVisitedCountriesText extends StatelessWidget {
  const SliverVisitedCountriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => CountryBookCountCubit()..getCountryBook(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: ColorsConsts.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Iconsax.airplane,
                  color: ColorsConsts.purple,
                  size: 24,
                ),
              ).staggerListVertical(0),
              16.spaceW,
              Expanded(
                child:
                    BlocBuilder<CountryBookCountCubit, CountryBookCountState>(
                  builder: (context, state) {
                    if (state is CountryBookCountFailure) {
                      return _buildText(context, 0);
                    }
                    final count = state is CountryBookCountSuccess
                        ? state.country.length
                        : 0;
                    return _buildText(context, count);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, int count) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Functions().staggeredList([
        Text(
          "${JsonConsts.iHaveVisited.t(context)} $count ${JsonConsts.countriesInALiteraryWay.t(context)}",
          style: StylesConsts.f16W600Black.copyWith(
            color: ColorsConsts.purple,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
        ),
        8.spaceH,
        Text(
          JsonConsts.exploreTheWorldThroughLiterature.t(context),
          style: StylesConsts.f15W400Grey.copyWith(
            fontSize: 14,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ]),
    );
  }
}
