
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/book_details/service/rate_abillity/rate_abillity_states.dart';

class RateAbilityCubit extends BaseCubit<RateAbilityStates> {
  RateAbilityCubit(bool ignore) : super( RateAbilityInitial(canRate: ignore));

  void updateCanRate(int progress, int numberOfPages) async {
    await Future.delayed(const Duration(milliseconds: 500));
    double readPercentage = (progress * 100) / numberOfPages;
    if (readPercentage >= 70) {
      emit(RateAbilityUpdated(canRate: true));
    } else {
      emit(RateAbilityUpdated(canRate: false));
    }
  }
}
