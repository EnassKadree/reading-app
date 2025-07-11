import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/my_library/UI/widgets/map_painter.dart';
import 'package:reading_app/features/my_library/map/cubit/map_cubit.dart';
import 'package:reading_app/features/my_library/map/cubit/map_state.dart';

class SvgInteractiveMap extends StatelessWidget {
  final Map<String, int> highlightedCountries;

  const SvgInteractiveMap({super.key, required this.highlightedCountries});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
  create: (_) => MapCubit(highlightedCountries),
  child: BlocBuilder<MapCubit, MapState>(
    builder: (context, state) {
      if (state is MapLoading || state is MapInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is MapLoaded) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          child: InteractiveViewer(
            minScale: 0.5,
            maxScale: 5.0,
            panEnabled: true,
            scaleEnabled: true,
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: 1000,  // حجم الرسم الأصلي
                height: 500,
                child: CustomPaint(
                  size: const Size(1000, 500),
                  painter: MapPainter(
                    countryPaths: state.paths,
                    highlightedCountries: highlightedCountries,
                    assignedColors: state.colors,
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    },
  ),
);
    
  }
}
