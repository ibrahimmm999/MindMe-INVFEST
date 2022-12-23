import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/models/message_model.dart';

class ChatService {
  final CollectionReference _chatReference =
      FirebaseFirestore.instance.collection('chat');

  Future<void> addChat(ChatModel chat) async {
    try {
      await _chatReference.doc().set({chat.toJson()});
    } catch (e) {
      throw e;
    }
  }

  Future<void> addMessage(MessageModel message, String chatId) async {
    try {
      await _chatReference.doc(chatId).collection('message').doc().set({
        'date': message.date,
        'senderId': message.senderId,
        'receiverId': message.receiverId,
        'text': message.text,
      });
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot<Object?>> chatStream() {
    return _chatReference.snapshots();
  }

  Stream<QuerySnapshot<Object?>> messageStream(String chatId) {
    return _chatReference.doc(chatId).collection('message').snapshots();
  }

  List<ChatModel> getChatList(dynamic snapshot) {
    List<ChatModel> data = snapshot.data!.docs
        .map((e) {
          return ChatModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        })
        .toList()
        .cast<ChatModel>();
    data = data
        .where((element) =>
            element.userId == FirebaseAuth.instance.currentUser!.uid)
        .toList();
    return data;
  }

  List<MessageModel> getMessageList(dynamic snapshot) {
    return snapshot.data!.docs.map((e) {
      return MessageModel.fromJson(e.id, e.data() as Map<String, dynamic>);
    }).toList();
  }
}
