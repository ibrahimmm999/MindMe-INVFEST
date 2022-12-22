import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/journey_model.dart';
import '../services/journey_service.dart';
part 'journey_state.dart';

class JourneyCubit extends Cubit<JourneyState> {
  JourneyCubit() : super(JourneyInitial());

  void fetchJourney() async {
    try {
      emit(JourneyLoading());
      List<JourneyModel> journey = await JourneyService().fetchJourneys();
      emit(JourneySuccess(journey));
    } catch (e) {
      emit(JourneyFailed(e.toString()));
    }
  }
}
