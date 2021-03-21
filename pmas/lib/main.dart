import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmas/screens/onboarding/Onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'screens/loginscreen.dart';
import 'screens/slashscreen.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMAS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'MerriweatherSans',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkFlag(context);

  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: Image(image: AssetImage('assets/pmaslogo.png'),
        height: 400, width: 400,),
      nextScreen: MyLoginScreen(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
      duration: 300,
        backgroundColor: Colors.grey[300],
    );
  }
}

void checkFlag(BuildContext context) async{
  bool visitingFlag=await getVisitingFlag();

  setVisitingFlag();

  if(visitingFlag == true){
    //when the user is not visiting for the first time
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => WelcomeScreen()
    ));
  }else{
    //when the user is visiting for the firstTime
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnBoardingScreenss()
    ));
  }
}

setVisitingFlag() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyVisited", true);
}

getVisitingFlag() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyVisited = preferences.getBool("alreadyVisited") ?? false;
  return alreadyVisited;
}
