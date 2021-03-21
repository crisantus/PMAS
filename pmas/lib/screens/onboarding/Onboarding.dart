import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pmas/screens/onboarding/Strings.dart';
import 'package:pmas/screens/onboarding/colorsSys.dart';
import 'package:pmas/screens/slashscreen.dart';

class OnBoardingScreenss extends StatefulWidget {
  OnBoardingScreenss({Key key}) : super(key: key);

  @override
  _OnBoardingScreenssState createState() => _OnBoardingScreenssState();
}

class _OnBoardingScreenssState extends State<OnBoardingScreenss> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: (){
                 Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
               child: Text(
                "Skip",
                style: TextStyle(
                    color: ColorsSys.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                image: 'assets/melone-otu.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent
              ),
              makePage(
                image: 'assets/melone-two.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent
              ),
              makePage(
                image: 'assets/melon-3.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse ? 
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 30,),
            ],
          ) : SizedBox(),
          Text(title, style: GoogleFonts.merriweather(
            textStyle: TextStyle(
            color: ColorsSys.primary,
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
          )),
          SizedBox(height: 5,),
          Text(content, textAlign: TextAlign.center, style: GoogleFonts.merriweather(
            textStyle: TextStyle(
            color: ColorsSys.gray,
            fontSize: 18,
            fontWeight: FontWeight.w400
          ),
          )),
          reverse ? 
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ) : SizedBox(),
        ],
      ),
    );
  }

   Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorsSys.secoundary,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
