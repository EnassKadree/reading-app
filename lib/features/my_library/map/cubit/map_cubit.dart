import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/features/shared/data/svg_parser.dart';
import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.highlightedCountries) : super(MapInitial()) {
    loadSvgData();
  }

  final Map<String, int> highlightedCountries;
  final random = Random();
  final List<Color> availableColors = [
    ColorsConsts.purple,
    ColorsConsts.pink,
    ColorsConsts.gold,
    const Color.fromARGB(255, 142, 112, 208),
  ];

  Future<void> loadSvgData() async {
    emit(MapLoading());

    final paths = await SvgParser.loadSvgPaths('assets/images/myLibrary/world.svg');

    final assignedColors = <String, Color>{};
    for (var code in highlightedCountries.keys) {
      assignedColors[code] = availableColors[random.nextInt(availableColors.length)];
    }

    emit(MapLoaded(paths: paths, colors: assignedColors, tappedCountry: null));
  }

  void onCountryTapped(String? code) {
    final current = state;
    if (current is MapLoaded) {
      emit(current.copyWith(tappedCountry: code));
    }
  }
}
