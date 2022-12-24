import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:src/services/chat_service.dart';

part 'get_chatId_state.dart';

class GetChatIdCubit extends Cubit<GetChatIdState> {
  GetChatIdCubit() : super(GetChatIdInitial());

  void getChatId(String userId, String consultantId) async {
    try {
      emit(GetChatIdLoading());
      String chatId = await ChatService().getChatId(userId, consultantId);
      emit(GetChatIdSuccess(chatId));
    } catch (e) {
      emit(GetChatIdFailed(e.toString()));
    }
  }
}
