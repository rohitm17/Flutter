import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByUsername(String username)async{
   return await  Firestore.instance.collection("users").where("name", isEqualTo: username).getDocuments();

  }
  getUserByUserEmail(String userEmail)async{
    return await  Firestore.instance.collection("users").where("name", isEqualTo: userEmail).getDocuments();

  }

  uploadUserInfo(userMap){

    Firestore.instance.collection("users").add(userMap);


  }

  createChatRoom(String chatRoomId, chatRoomMap){
    Firestore.instance.collection("Chatroom")
        .document(chatRoomId).setData(chatRoomMap).catchError((e){
          print(e.toString());
    });
  }

  addConversationMessages(String chatRoomId, messageMap) async{
    return Firestore.instance
        .collection("Chatroom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e){print(e.toString());});
  }

  getConversationMessages(String chatRoomId) async{
    return Firestore.instance
        .collection("Chatroom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("time",descending: false)
        .snapshots();
  }

  getChatRooms(String userName)async{
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: userName)
        .snapshots();
  }

}