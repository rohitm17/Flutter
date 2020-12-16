import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  )
  );
}

class HomePage extends StatelessWidget
{
  String _ip;
  String pass;

  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit:  BoxFit.fill,
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/light-1.png')
                      )
                    ),
                  )
                  ),
                Positioned(
                  left: 150,
                width: 80,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png')
                      )
                  ),
                )
            ),
                  Positioned(
                    right: 30,
                      top: 40,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png')
                            )
                        ),
                      )
                  ),
                  Positioned(

                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Center(
                          child: Text("Login", style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      )
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(150, 150, 250, .7),
                        blurRadius: 20,
                        offset: Offset(0,10)
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border( bottom: BorderSide(color: Colors.grey.shade500))
                        ),
                        child: TextField(
                          onChanged: (value){
                              _ip=value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email or Phone Number or IP",
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,

                            )
                          ),



                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),

                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,

                              )
                          ),
                          onChanged: (value){
                            pass=value;
                          },
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6)
                            ]
                          )
                        ),
                        child: Center(
                          child: Text("Login" , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 10,),
                     Text("Forgot Password" , style: TextStyle(color: Color.fromRGBO(143, 148, 251, .6))),

                    ],
                  ),
                )
              ],

            ),
            )
          ],
        ),
      ),

    );
  }
}
