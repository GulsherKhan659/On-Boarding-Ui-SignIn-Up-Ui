import 'package:flutter/material.dart';
import 'package:flutter_app4/screens/logInScreen.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/pagebodywidget.dart';
import '../utiles/constants.dart';

class OnboardingWidget extends StatefulWidget {

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _endCounter; i++) {
      list.add(i == _startCounter ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delayFunction();

  }


    void delayFunction(){
     Future.delayed(Duration(seconds:3),_loopboardingScreen);
    }

      void _loopboardingScreen()async{
    for(int i=0;i<_endCounter;i++){

        await _pageController.nextPage(duration:Duration(seconds:3), curve: Curves.ease);
       }
       }
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
  PageController _pageController = PageController(initialPage:0 );
  int _startCounter =0;
  int _endCounter =3;
  bool isBottomSheetShow=false;
  _goNextBoarding(){
    setState(() {
  if(_startCounter <=1){
        _startCounter++;
        _pageController.nextPage(duration: Duration(seconds:1), curve:Curves.ease);
      }else{
        //_startCounter=0;
        isBottomSheetShow = !isBottomSheetShow;

      }});

  }///function
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (_,layoutsize){
          return Container(
              decoration:KBackgroundDecoration,
            width: layoutsize.maxWidth,
            height: layoutsize.maxHeight,
            padding: EdgeInsets.symmetric(vertical:layoutsize.maxHeight * 0.01),
            child: Container(
              //color: Colors.amber,
              child: (
               Column(children: [
                ButtonWidget(
                  buttonTitle: "SKIP",
                  buttonFunction: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>LogInScreen()));
                  },
                  layoutsize: layoutsize,),
                Expanded(
                  child: Container(
                  //  color: Colors.deepOrange,
                    child: PageView(

                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                    onPageChanged: (value){
                          setState(() {
                           _startCounter=value;
                           if(_startCounter ==2){
                             isBottomSheetShow  = !isBottomSheetShow;
                           }else if(isBottomSheetShow){
                             _loopboardingScreen();
                             isBottomSheetShow  = !isBottomSheetShow;
                           }
                         //  print("Flip ${_startCounter}");
                          });

                    },
                    children: [
                      PageBodyWidget(
                        pageImageURL: "assets/images/onboarding0.png",
                        pageTitle: "Connect people around the world",
                        pageContent: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                        layoutSize: layoutsize,
                      ),
                      PageBodyWidget(
                        pageImageURL: "assets/images/onboarding1.png",
                        pageTitle: "Live your life smarter with us!",
                        pageContent: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                        layoutSize: layoutsize,
                      ),
                      PageBodyWidget(
                        pageImageURL: "assets/images/onboarding2.png",
                        pageTitle: "Get a new experience of imagination",
                        pageContent: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                        layoutSize: layoutsize,
                      ),

                    ],
                    ),
                  ),
                ),
                 Padding(padding:EdgeInsets.all(6),child:Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: _buildPageIndicator(),
                 )),
                 !isBottomSheetShow ? ButtonWidget(
                   buttonTitle: "Next",
                   buttonFunction:_goNextBoarding,
                   layoutsize: layoutsize,):Text(""),
               ])
              ),
            ),
            //color:Colors.grey.shade50
          );
        },),
        bottomSheet: isBottomSheetShow ?Container(
          height: 100.0,
          width: double.infinity,
          color: Colors.white,
          child: GestureDetector(
            onTap: () =>  Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>LogInScreen())),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Get started',
                  style: kButtonTextStyle,
                ),
              ),
            ),
          ),
        )
            : Text('')
      ),
    );
  }

}
