part of 'journey_cubit.dart';

abstract class JourneyState extends Equatable {
  const JourneyState();

  @override
  List<Object> get props => [];
}

class JourneyInitial extends JourneyState {}

class JourneyLoading extends JourneyState {}

class JourneySuccess extends JourneyState {
  final List<JourneyModel> journey;

  JourneySuccess(this.journey);
  @override
  // TODO: implement props
  List<Object> get props => [journey];
}

class JourneyFailed extends JourneyState {
  final String error;
  JourneyFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
