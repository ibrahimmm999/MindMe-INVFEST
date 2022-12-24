import 'package:bloc/bloc.dart';

class ChangeImageCubit extends Cubit<String> {
  ChangeImageCubit() : super('');

  void setImage(String imagePath) async {
    emit(imagePath);
  }
}
