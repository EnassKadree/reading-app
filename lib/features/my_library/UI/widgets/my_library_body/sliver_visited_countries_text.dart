import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/my_library/services/country_book_count/country_book_count_cubit.dart';

class SliverVisitedCountriesText extends StatelessWidget {
  const SliverVisitedCountriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (_) => CountryBookCountCubit()..getCountryBook(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.airplanemode_active_outlined),
              6.spaceW,
              Expanded(
                child:
                    BlocBuilder<CountryBookCountCubit, CountryBookCountState>(
                  builder: (context, state) {
                    final count = state is CountryBookCountSuccess
                        ? state.country.length
                        : 0;
                    return Text(
                      maxLines: 2,
                      "${JsonConsts.iHaveVisited.t(context)} $count ${JsonConsts.countriesInALiteraryWay.t(context)}",
                      style: StylesConsts.introText.copyWith(
                        color: ColorsConsts.purple,
                        fontStyle: FontStyle.normal,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
