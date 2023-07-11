import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone/models/chat.dart';
import 'package:whatsapp_clone/models/messages.dart';

class ChatService {
  final db = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  String lastSenderId = "";

  String generateChatId() {
    final uuid = Uuid();
    return uuid.v4();
  }

  Future<void> createChat(
      Chat chat, String senderId, String recieverId, String lastMessage) async {
    await db
        .collection('users')
        .doc(senderId)
        .collection("messages")
        .doc(recieverId)
        .collection("chats")
        .doc(generateChatId())
        .set(chat.toMap());
    await db
        .collection('users')
        .doc(recieverId)
        .collection("messages")
        .doc(senderId)
        .collection("chats")
        .doc(generateChatId())
        .set(chat.toMap());
    await db
        .collection('users')
        .doc(senderId)
        .collection("messages")
        .doc(recieverId)
        .set({
      'lastMessage': lastMessage,
      'senderId': senderId,
    });
    await db
        .collection('users')
        .doc(recieverId)
        .collection("messages")
        .doc(senderId)
        .set({
      'lastMessage': lastMessage,
      'senderId': senderId,
    });
  }

  Future<String> getLastMessage(String senderId, String recieverId) async {
    final snapshot = await db
        .collection('users')
        .doc(recieverId)
        .collection("messages")
        .doc(senderId)
        .get();
    return snapshot.data()!['lastMessage'];
  }

  Future<void> getSenderId(String senderId, String recieverId) async {
    final snapshot = await db
        .collection('users')
        .doc(recieverId)
        .collection("messages")
        .doc(senderId)
        .get();
    lastSenderId = await snapshot.data()!['senderId'];
  }

  String getLastSenderId() {
    return lastSenderId;
  }
}
