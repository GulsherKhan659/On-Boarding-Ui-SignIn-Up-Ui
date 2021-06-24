import 'package:flutter/material.dart';
import '../utiles/constants.dart';

//TextField
class TextEditingBox extends StatelessWidget {
  final  heightRatio;
  final  boxText;
  final  boxHintText;
  final  boxKeyboardType;
  final  boxIcon;
  final  textController;
  TextEditingBox({this.boxText,this.boxKeyboardType,this.boxIcon,this.boxHintText,this.textController,this.heightRatio});
  //TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(child: Text(boxText,style: kTextStyle)),
          SizedBox(height: heightRatio*0.005),

          Container(
          height: heightRatio*0.09,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            //color: Colors.amber
          ),
          child:TextField(
            textInputAction: TextInputAction.next,
            keyboardType: boxKeyboardType,
            controller: textController,
             style:kTextEditingBox,
            decoration:InputDecoration(
              focusColor: Colors.white,

              hintStyle:kHintTextStyle,
              contentPadding: EdgeInsets.only(top: 14.0),
              border: InputBorder.none,
              prefixIcon: Icon(boxIcon,color:Colors.white70,),
              hintText:boxHintText
            ),
          ),
        ),
      ],
    );
  }
}

//Password Field
class TextPassEditingBox extends StatelessWidget {
  final isVisible,vissibleFun,heightRatio;
  final textController;
  TextPassEditingBox({this.isVisible,this.vissibleFun,this.textController,this.heightRatio});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(child: Text("Password",style:kTextStyle,)),
        SizedBox(height: heightRatio*0.005),
        Container(
          height: heightRatio*0.09,
          // padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
           //   color: Colors.amber
          ),
          child:TextField(
            keyboardType: TextInputType.visiblePassword,
            controller: textController,
            obscureText: isVisible,

            style:kTextEditingBox,
            decoration:InputDecoration(

              hintStyle:kHintTextStyle,
                contentPadding: EdgeInsets.only(top: 14.0),
                border: InputBorder.none,


                prefixIcon: Icon(Icons.lock,color:Colors.white70,),
                hintText: 'Enter Password',
                suffixIcon:IconButton(
                    color: Colors.white70,
                    icon: Icon(isVisible?Icons.visibility_off:Icons.visibility), onPressed: vissibleFun) ,

            ),
          ),
        ),
      ],
    );
  }
}
