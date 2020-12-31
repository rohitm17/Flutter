import 'package:chat_app/helper/constants.dart';
import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/conversation_screen.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();


}

String _myName;

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchTextEditingController=new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot searchSnapshot;
  createChatRoomandStartConversation({String userName}){
    if(userName != Constants.myName){

      String chatRoomId= getChatRoomId(userName, Constants.myName);
      List<String> users = [userName, Constants.myName];
      Map<String,dynamic> chatRoomMap={
        "users":users,
        "chatroomId": chatRoomId
      };
      DatabaseMethods().createChatRoom(chatRoomId,chatRoomMap);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ConversationScreen(chatRoomId)));

    }
  }
  Widget searchList(){
    return searchSnapshot != null? ListView.builder(itemCount: searchSnapshot.documents.length,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return SearchTile(
            userEmail: searchSnapshot.documents[index].data()["email"],
            userName: searchSnapshot.documents[index].data()["name"],
          );
        }):Container();
  }
  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){

     setState(() {
       searchSnapshot=val;
     });
    });
  }

  Widget SearchTile({String userName, String userEmail}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName,style: mediumTextStyle(),),
                Text(userEmail,style: mediumTextStyle(),)
              ],
            )
            ,
            Spacer(),
            GestureDetector(
              onTap: (){
                createChatRoomandStartConversation(userName:userName);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular( 30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Text("Message",style: mediumTextStyle(),),
              ),
            )
          ],
        )
    );
  }

  @override
  void initState() {
    //getUserInfo();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        color: Color(0x54FFFFFF),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      style: TextStyle(
                color: Colors.white54,
                                ) ,
                        decoration: InputDecoration(
                          hintText: "search username",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          border: InputBorder.none

                        ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
                    },
                    child: Container(
                      height: 40,
                        width: 40,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0x36FFFFFF),
                              const Color(0x0FFFFFFF)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: Image.asset("assets/images/search_white.png")),
                  ),
                ],
              ),
            ),
            searchList()
          ],
        ),
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}