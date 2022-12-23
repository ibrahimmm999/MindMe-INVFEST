import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:src/models/user_model.dart';
import 'package:src/services/user_service.dart';

part 'consultant_state.dart';

class ConsultanCubit extends Cubit<ConsultantState> {
  ConsultanCubit() : super(ConsultantInitial());

  void fetchConsultants() async {
    try {
      emit(ConsultantLoading());
      List<UserModel> consultans = await UserService().fetchConsultans();

      emit(ConsultantSuccess(consultans));
    } catch (e) {
      emit(ConsultantFailed(e.toString()));
    }
  }
}
