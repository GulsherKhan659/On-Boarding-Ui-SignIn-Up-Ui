import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app4/widgets/alertbox.dart';
import '../widgets/textBox.dart';
import '../widgets/buttonDesign.dart';
import '../widgets/footerWidgets.dart';
import "../utiles/constants.dart";
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'homeScreen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'signUpScreen.dart';
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool visible=true,isChecked=false;
  TextEditingController email= TextEditingController();
  TextEditingController password= TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final fbLogin = FacebookLogin();

  void googleSignInFunction()async{
    final googleUser = await googleSignIn.signIn();
    if(googleUser == null) return alertDialogbox(context);

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      c
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) =>{
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomeScreen()))
      });

  }

  Future signInFB() async {
    final FacebookLoginResult result = await fbLogin.logIn(["email"]);
    switch (result.status){
      case FacebookLoginStatus.loggedIn:
           print ("Login");
           break;
      case FacebookLoginStatus.error :
           print("Error");
           break;
       case FacebookLoginStatus.cancelledByUser :
        print("cancelledBuyer");
             break;
      default : print("Result is Not Fetch");

    }
  }
 void runFunction(){
   if(email.value.text.isNotEmpty && password.value.text.isNotEmpty && isChecked){
     FocusScope.of(context).unfocus();
     String  uemail = email.value.text;
     String upassword = password.value.text;
      FirebaseAuth.instance.signInWithEmailAndPassword(email: uemail, password: upassword).then(
              (UserCredential credential){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)=>HomeScreen(name: 'email', email: uemail,)));
              } );}
    else{
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
    double subHeight= MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: KBackgroundDecoration,
            ),
            LayoutBuilder(builder: (context, layoutsize) {

              return  SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                 // width: layoutsize.maxWidth,
                  height:subHeight - (subHeight * 0.05),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Spacer(flex: 2,),
                      FittedBox(
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            WavyAnimatedText('LogIn',textStyle: kHeadingStyle1),
                          //  WavyAnimatedText('Look at the waves'),
                          ],
                          isRepeatingAnimation: true,
                          onTap: (){},
                        ),
                      ),
                     Spacer(flex: 1,),
                      TextEditingBox(
                        heightRatio:subHeight,
                        textController:email,
                        boxHintText: "Enter Email Address",
                        boxText: "Email",
                        boxIcon: Icons.email,
                        boxKeyboardType: TextInputType.emailAddress,
                      ),
                       Spacer(flex: 1,),
                      TextPassEditingBox(
                        heightRatio: subHeight,
                        textController: password,
                        isVisible: visible,
                        vissibleFun: _vissibleFun,
                      ),

                      Spacer(flex: 1,),
                      Row(
                        children: [
                          Checkbox(
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              checkColor: Colors.white70,
                              activeColor: Colors.black,

                              value:isChecked, onChanged:(value){
                            setState(() {
                              isChecked=value ?? false;
                            });
                          }),
                          FittedBox(child: Text("Remember Me",style: kTextStyle)),
                        ],
                      ),
                  Spacer(flex: 1,),
                      ButtonDesign(
                        height: subHeight,
                        width:layoutsize.maxWidth,
                        buttonText: "Login",
                        buttonFunction: runFunction,),
                    Spacer(flex: 1,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text("Forget Password?",style:TextStyle(
                             color: Colors.white,
                             fontSize: 10,
                             height: 1.6,
                        )),
                      ),
                      Spacer(flex: 2,),
                      Column(
                        children: [

                         FittedBox(child: Text("--OR--",style: kTextStyle)),
                          SizedBox(
                            height:layoutsize.maxHeight * 0.02,
                          ),
                          FittedBox(child: Text("SignIn with",style: kTextStyle)),
                          // Text("SignIn with",style: kTextStyle),
                        ],
                      ),
                      Spacer(flex: 1,),
                      FooterWidgetSocialIcon(
                        firstImage: AssetImage("assets/images/facebook.png"),
                        secondImage: AssetImage("assets/images/google.png"),
                        firstFunction:()=>signInFB(),
                        secondFunction: () => googleSignInFunction() ,

                      ),
                      Spacer(flex: 1,),
                      MaterialButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen())
                          ); },
                        child: RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "Create an Account?"),
                              TextSpan(text: "SignUp",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )),

                            ]
                        )),

                      ),
                      Spacer(flex: 2,),
                    ],),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
