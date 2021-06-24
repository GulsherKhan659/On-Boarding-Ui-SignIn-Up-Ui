import 'package:flutter/material.dart';
import 'package:flutter_app4/utiles/constants.dart';

class ButtonDesign extends StatelessWidget {
  final height,width,buttonText,buttonFunction;
  ButtonDesign({this.width,this.buttonText,this.buttonFunction,this.height});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: width,
        decoration: BoxDecoration(
        color: Colors.white,
       // gradient: ,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0.0,2.5)
          )
        ],
        borderRadius: BorderRadius.circular(50)
        ),
        child: MaterialButton(
        highlightColor:Colors.transparent,

        padding: EdgeInsets.symmetric(vertical:height * 0.025,horizontal: 40),
        onPressed:buttonFunction,

    child:FittedBox(
      child: Text(buttonText,style:kButtonTextStyle,),
    ),

        )

        );
  }
}
