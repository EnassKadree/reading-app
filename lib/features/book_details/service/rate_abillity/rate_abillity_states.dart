
abstract class RateAbilityStates {
   bool canRate;
   RateAbilityStates({required this.canRate});
}

class RateAbilityInitial extends RateAbilityStates {
   RateAbilityInitial({required super.canRate});
}

class RateAbilityUpdated extends RateAbilityStates {
   RateAbilityUpdated({required super.canRate});
}
