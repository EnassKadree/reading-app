import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/features/my_library/UI/widgets/map_builder.dart';
import 'package:reading_app/features/my_library/services/country_book_count/country_book_count_cubit.dart';

class SliverMapContainer extends StatelessWidget {
  const SliverMapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.28,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorsConsts.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: ColorsConsts.purple.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsConsts.purple.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
              spreadRadius: 2,
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: BlocProvider(
          create: (context) => CountryBookCountCubit()..getCountryBook(),
          child: const MapBuilder(),
        ),
      ),
    );
  }
}
