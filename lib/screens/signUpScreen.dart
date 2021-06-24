import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_app4/widgets/alertbox.dart';

import '../widgets/textBox.dart';
import '../widgets/buttonDesign.dart';
import '../widgets/footerWidgets.dart';
import '../utiles/constants.dart';
import 'homeScreen.dart';
import 'logInScreen.dart';
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool visible=true,isChecked=false;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController name = TextEditingController();
  void runFunction(){
    if(name.value.text.isNotEmpty && email.value.text.isNotEmpty && password.value.text.isNotEmpty && isChecked){
      FocusScope.of(context).unfocus();
      String  uemail = email.value.text;
      String upassword = password.value.text;
      try{
        var user = FirebaseAuth.instance.createUserWithEmailAndPassword(email: uemail, password: upassword).then(
                (UserCredential credential){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>HomeScreen(name: 'Register', email: uemail,)));
            } );
      } on FirebaseAuth catch(e){
        print(e);
      }
    }else{
       alertDialogbox(context);
    }
    setState(() {

    });
  }
  void _vissibleFun(){
    setState(() {
      visible = !visible;
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    double subheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
               decoration:KBackgroundDecoration,
                ),
            LayoutBuilder(builder: (context, layoutsize) {
              return  SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  // width: layoutsize.maxWidth,
                  height:subheight - (subheight * 0.05),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(flex:2),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          WavyAnimatedText('SignUp',textStyle:kHeadingStyle1),
                          //  WavyAnimatedText('Look at the waves'),
                        ],
                        isRepeatingAnimation: true,
                        onTap: (){},
                      ),
                      Spacer(flex:1),
                      TextEditingBox(
                        heightRatio:subheight,
                        textController: name,
                        boxHintText: "Enter Your Name",
                        boxText: "Name",
                        boxIcon: Icons.person,
                        boxKeyboardType: TextInputType.text,
                      ),
                      Spacer(flex:1),
                      TextEditingBox(
                        heightRatio: subheight,
                        textController: email,
                        boxHintText: "Enter Email Address",
                        boxText: "Email",
                        boxIcon: Icons.email,
                        boxKeyboardType: TextInputType.emailAddress,
                      ),
                      Spacer(flex:1),
                      TextPassEditingBox(
                        heightRatio:subheight,
                        textController: password,
                        isVisible: visible,
                        vissibleFun: _vissibleFun,
                      ),
                      Spacer(flex:1),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.white70,
                              activeColor: Colors.black,
                              value:isChecked, onChanged:(value){
                            setState(() {
                              isChecked= value ?? false;
                            });
                          }),
                          Text("Terms & Conditions",style: kTextStyle)
                        ],
                      ),
                      Spacer(flex:1),
                      ButtonDesign(
                        height: subheight,
                        width:layoutsize.maxWidth,buttonText: "SignUp",buttonFunction: runFunction,),
                    Spacer(flex:2),
                      Column(
                        children: [

                          Text("--OR--",style: kTextStyle),
                          SizedBox(
                            height:layoutsize.maxHeight * 0.01,
                          ),
                          Text("SignUp with",style: kTextStyle),
                        ],
                      ),
                      Spacer(flex:1),
                      FooterWidgetSocialIcon(
                        firstImage: AssetImage("assets/images/facebook.png"),
                        secondImage: AssetImage("assets/images/google.png"),
                        firstFunction:(){setState(() {
                          print("Facebook SignUp");
                        });} ,
                        secondFunction: (){setState(() {
                          print("Google SignUp");
                        });} ,

                      ),
                      Spacer(flex:1),
                         MaterialButton(

                        onPressed: (){
                          print("Click");
                          Navigator.push(
                          context,
                         MaterialPageRoute(builder: (context) => LogInScreen())
                       ); },child: RichText(

                            text: TextSpan(
                            children: [
                              TextSpan(text: "Already have account?"),
                              TextSpan(text: "SignIn",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ))
                            ]
                        )),
                      ),

                      Spacer(flex: 2,),  ],),

                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
