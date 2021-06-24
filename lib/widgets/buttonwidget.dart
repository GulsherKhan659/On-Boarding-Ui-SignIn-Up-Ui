import 'package:flutter/material.dart';


class ButtonWidget extends StatelessWidget {
  final layoutsize;
  final buttonTitle;
  final buttonFunction;
  ButtonWidget({this.layoutsize,this.buttonTitle,this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.centerRight,
      height: layoutsize.maxHeight*0.09,
      width: double.infinity,
      //color:Colors.blue,
      child: GestureDetector(
        onTap:buttonFunction,
        child: FittedBox(
          child: Container(
            alignment: Alignment.center,
              height: layoutsize.maxHeight*0.08,
              width: layoutsize.maxWidth*0.3,
            child: Text(buttonTitle,style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400
            ),),
         //   color:Colors.deepOrange

          ),
        ),
      ),
    );
  }
}
