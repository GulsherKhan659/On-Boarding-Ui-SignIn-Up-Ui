import 'package:flutter/material.dart';


class FooterWidgetSocialIcon extends StatelessWidget {
  final firstImage,secondImage,firstFunction,secondFunction;
  FooterWidgetSocialIcon({this.firstImage,this.secondImage,this.firstFunction,this.secondFunction});
  //  const FooterWidgetSocialIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _socialButton(firstImage,firstFunction),
        _socialButton(secondImage,secondFunction)
      ],
    );
  }
  Widget _socialButton(AssetImage assetImage,Function function){
    return  Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
                color:Colors.white
        ),
        child:GestureDetector(
          onTap: ()=> function(),
          child: Image(
          image: assetImage,
        ),
      ),
    );
  }
}
