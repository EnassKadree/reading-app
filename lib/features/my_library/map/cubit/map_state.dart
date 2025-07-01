import 'package:flutter/material.dart';

abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {}

class MapLoaded extends MapState {
  final Map<String, Path> paths;
  final Map<String, Color> colors;
  final String? tappedCountry;

  MapLoaded({
    required this.paths,
    required this.colors,
    required this.tappedCountry,
  });

  MapLoaded copyWith({String? tappedCountry}) {
    return MapLoaded(
      paths: paths,
      colors: colors,
      tappedCountry: tappedCountry ?? this.tappedCountry,
    );
  }
}
