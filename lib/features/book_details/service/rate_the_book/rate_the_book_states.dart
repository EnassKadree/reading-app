abstract class RateState {}
class SuccessRateState extends  RateState{}
class LoadingRateState extends  RateState{}
class InitialRateState extends  RateState{}
class ErrorRateState extends  RateState{
  String errorMessage;
  ErrorRateState(this.errorMessage);
}