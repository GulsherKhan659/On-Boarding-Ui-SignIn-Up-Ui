import 'package:flutter/material.dart';
import 'package:flutter_app4/screens/onboardingscreen.dart';
import 'package:firebase_core/firebase_core.dart';

    void main() async{
      WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
      runApp(MyApp());}


    class MyApp extends StatelessWidget {

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: "Sign In /Sign Out",
          home: OnboardingWidget()//SignUpScreen()//LogInScreen(),
        );
      }
    }
