import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatRoomScreen.dart';

class SignIn extends StatefulWidget {

  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passowrdTextEditingController = new TextEditingController();
  final formKey=GlobalKey<FormState>();

  bool isLoading=false;
  QuerySnapshot snapshotUserInfo;

  signIn(){
    if(formKey.currentState.validate()){
      HelperFunctions.saveUserEmailSharedPreferences(emailTextEditingController.text);
     // HelperFunctions.saveUserEmailSharedPreferences(userNameTextEditingController.text);

      setState(() {
        isLoading=true;
      });
      databaseMethods.getUserByUserEmail(emailTextEditingController.text).then((val){
                    snapshotUserInfo=val;
                    HelperFunctions.saveUserNameSharedPreferences(snapshotUserInfo.documents[0].data()["name"]);
      });
      authMethods.signInWithEmailAndPassowrd(emailTextEditingController.text, passowrdTextEditingController.text).then((val) {
        if(val!=null){

          HelperFunctions.saveUserLoggedInSharedPreferences(true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChatRoom()));

        }
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height-50,
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                          validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                            null : "Enter valid email";
                          },
                        controller: emailTextEditingController,
                        decoration: textFieldInputDecoration("email"),
                          style: simpleTextStyle()
                        ),


                      TextFormField(
                        obscureText: true,
                          validator: (val){
                            return val.length>6 ? null : "Please provide passowrd 6+ character";
                          },
                        controller: passowrdTextEditingController,
                        decoration: textFieldInputDecoration("password"),
                        style: simpleTextStyle()
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Text("forgot password?", style: simpleTextStyle(),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          signIn();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                             colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                                               ]
                                  )
                          ),

                          child: Text("Sign In", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 18),
                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(30),

                        ),

                        child: Text("Sign In with Google", style: TextStyle(
                            color: Colors.black,
                            fontSize: 18
                        ),),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: mediumTextStyle(),),
                          GestureDetector(
                            onTap: (){
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text("Register now", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                decoration: TextDecoration.underline

                              ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 50,)



                    ],
                  ),
                ),
              ),
            ),
          ),

    );
  }
}
