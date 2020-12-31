import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/chatRoomScreen.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
class SignUp extends StatefulWidget {

  final Function toggle;

  SignUp(this.toggle);


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods=new AuthMethods();
  DatabaseMethods databaseMethods=new DatabaseMethods();
  HelperFunctions helperFunctions = new HelperFunctions();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passowrdTextEditingController = new TextEditingController();

  signMeUP(){

    if(formKey.currentState.validate()){
      Map<String,String> userInfoMap={
        "name" :userNameTextEditingController.text,
        "email" : emailTextEditingController.text
      };
      
       HelperFunctions.saveUserEmailSharedPreferences(emailTextEditingController.text);
       HelperFunctions.saveUserEmailSharedPreferences(userNameTextEditingController.text);

      setState(() {
        isLoading=true;
      });
      authMethods.signUpWithEmailAndPassword
        (emailTextEditingController.text, passowrdTextEditingController.text).
        then((val) => print("${val.uid}")
      );

      databaseMethods.uploadUserInfo(userInfoMap);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ChatRoom()));


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading?Container(
        child: Center(child: CircularProgressIndicator()),
      ):SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height-50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                  children: [
                    TextFormField(
                      validator: (val){
                        return val.isEmpty|| val.length<2 ? "Please provide valid username":null ;
                      },
                   controller: userNameTextEditingController,
                   decoration: textFieldInputDecoration("username"),
                   style: simpleTextStyle()
                     ),
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
                         validator: (val){
                            return val.length>6 ? null : "Please provide passowrd 6+ character";
                         },
                       obscureText: true,
                       controller: passowrdTextEditingController,
                       decoration: textFieldInputDecoration("password"),
                         style: simpleTextStyle()
                       ),
                        ],
                    ),
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
                    signMeUP();
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
                    Text("Already have an account?", style: mediumTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text("Login", style: TextStyle(
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
    );
  }
}
