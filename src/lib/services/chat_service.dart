import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:src/models/chat_model.dart';
import 'package:src/models/message_model.dart';
import 'package:src/models/user_model.dart';

class ChatService {
  final CollectionReference _chatReference =
      FirebaseFirestore.instance.collection('chat');

  Future<void> addChat(
      String consultantId, String userId, String lastMessage) async {
    try {
      await _chatReference.doc().set({
        'consultantId': consultantId,
        'userId': userId,
        'lastMessage': lastMessage,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<void> addMessage(String senderId, String receiverId, String text,
      Timestamp date, String chatId) async {
    try {
      await _chatReference.doc(chatId).collection('messages').doc().set({
        'date': date,
        'senderId': senderId,
        'receiverId': receiverId,
        'text': text,
      });
    } catch (e) {
      throw e;
    }
  }

  Stream<QuerySnapshot<Object?>> chatStream() {
    return _chatReference.snapshots();
  }

  Stream<QuerySnapshot<Object?>> messageStream(String chatId) {
    return _chatReference.doc(chatId).collection('messages').snapshots();
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
    return snapshot.data!.docs
        .map((e) {
          return MessageModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        })
        .toList()
        .cast<MessageModel>();
  }

  Future<String> getChatId(String userId, String consultantId) async {
    QuerySnapshot result = await _chatReference.get();
    List<ChatModel> posts = result.docs.map((e) {
      return ChatModel.fromJson(e.id, e.data() as Map<String, dynamic>);
    }).toList();
    String chatId = posts
        .where((element) =>
            element.userId == userId && element.consultantId == consultantId)
        .toList()
        .first
        .chatId;
    return chatId;
  }
}
