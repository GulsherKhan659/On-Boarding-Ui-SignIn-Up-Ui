import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app4/screens/logInScreen.dart';

class HomeScreen extends StatelessWidget {
  final String? email;
  final String? name;
  HomeScreen({this.name,this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      ) ,
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              name == "email" ?
              Text("Hi, $email",style: TextStyle(fontSize: 15),):Text("Hi $name & email : $email"),

              Text("Welcome",style: TextStyle(fontSize: 25),),
            Text("To",style: TextStyle(fontSize: 35),),
              Image(image: AssetImage("assets/images/logo.png"),
              //height: MediaQuery.of(context).size.width/4,
             // width:  MediaQuery.of(context).size.width/4,
                //fit: BoxFit.fill,
              ),
              TextButton(onPressed: (){
                FirebaseAuth.instance.signOut().then(
                        (value) =>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>LogInScreen()))).catchError((e){
                          print(e);
                });
              }, child:Container(
                color: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: Text("SignOut",style: TextStyle(
                    color: Colors.white
                  ),))),
          ],),
        ),
      ),
    );
  }
}
