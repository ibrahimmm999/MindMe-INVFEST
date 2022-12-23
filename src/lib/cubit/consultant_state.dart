part of 'consultant_cubit.dart';

@immutable
abstract class ConsultantState {}

class ConsultantInitial extends ConsultantState {}

class ConsultantLoading extends ConsultantState {}

class ConsultantSuccess extends ConsultantState {
  final List<UserModel> consultants;

  ConsultantSuccess(this.consultants);

  @override
  List<Object> get props => [consultants];
}

class ConsultantFailed extends ConsultantState {
  final String error;

  ConsultantFailed(this.error);

  @override
  List<Object> get props => [error];
}
