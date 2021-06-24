import 'dart:ui';

import 'package:flutter/material.dart';


const kHintTextStyle= TextStyle(color: Colors.white70);

const kTextStyle=TextStyle(
    color: Colors.white,
    fontSize:11.5,
    letterSpacing: 1.1
);

const kTextEditingBox = TextStyle(
  color: Colors.white,
  //decoration: TextDecoration.none,
  fontSize: 13,

);

//const kButtonColor = Color(0xFF5B16D0);
const kButtonTextStyle = TextStyle(
  color: Color(0xFF5B16D0),
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kHeadingStyle1 = TextStyle(
  letterSpacing: 1.5,
  color: Colors.white,
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);

const KBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.4, 0.7, 0.9],
    colors: [
      Color(0xFF3594DD),
      Color(0xFF4563DB),
      Color(0xFF5036D5),
      Color(0xFF5B16D0),
    ],
  ),);