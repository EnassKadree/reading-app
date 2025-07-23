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
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.25,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorsConsts.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 6),
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
