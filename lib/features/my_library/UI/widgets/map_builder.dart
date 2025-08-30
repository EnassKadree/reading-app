import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/my_library/UI/widgets/svg_interactive_map.dart';
import 'package:reading_app/features/my_library/services/country_book_count/country_book_count_cubit.dart';

import '../../../shared/widgets/mini_some_thing_went_wrong_widget.dart';

class MapBuilder extends StatelessWidget {
  const MapBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBookCountCubit, CountryBookCountState>(
        builder: (context, state) {
      if (state is CountryBookCountLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is CountryBookCountSuccess) {
        // حوّل البيانات من List إلى Map<String, int>
        final Map<String, int> countryMap = {
          for (var item in state.country) item.countryCode: item.bookCount,
        };

        return SvgInteractiveMap(
          highlightedCountries: countryMap,
        );
      }

      return MiniSomeThingWentWrongWidget(
        onPressed: () => context.read<CountryBookCountCubit>().getCountryBook(),
      );
    });
  }
}
