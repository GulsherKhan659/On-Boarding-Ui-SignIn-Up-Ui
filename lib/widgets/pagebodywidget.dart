import 'package:flutter/material.dart';


class PageBodyWidget extends StatelessWidget {
  final layoutSize;
  final pageTitle,pageImageURL,pageContent;

  PageBodyWidget({this.layoutSize,this.pageTitle,this.pageImageURL,this.pageContent});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: layoutSize.maxWidth*0.09),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage(pageImageURL),
            )
          ),

          height: layoutSize.maxHeight*0.38,
         // width: layoutSize.maxWidth*0.9,
        ),
     //  Spacer(flex: 1,),
        Container(
          width: layoutSize.maxWidth*0.7,
          child: Text(pageTitle,style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            height: 1.4
          ),),
        ),
        //  Spacer(flex: 1,),
          SizedBox(height:layoutSize.maxHeight*0.04),
        Text(pageContent,style: TextStyle(
          color: Colors.white
        ),)
      ],),
    );
  }
}
