import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:netflix_clone/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login.dart';
import 'SignInScreen.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class TestScreen extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      subTitleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
      titleTextStyle:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold) ,
      imageHeight: 250,
      title: 'No Annoying Contracts',
      subTitle: 'Join today,cancel anytime',
      imageUrl: 'assets/images/onboarding3.jpg',
    ),
    Introduction(
      subTitleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
      titleTextStyle:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold) ,
      title: 'Watch Your favourtes',
      imageHeight: 250,
      subTitle: 'Watch anytime day or night',
      imageUrl: 'assets/images/onboarding.jpg',
    ),
    Introduction(
      subTitleTextStyle: TextStyle(color: Colors.white,fontSize: 15),
      titleTextStyle:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,) ,
      title: 'Unlimited tv programms',
      imageHeight: 250,
      subTitle: 'Watch anywhere.cancel anytime',
      imageUrl: 'assets/images/onboarding1.jpg',
    ),
    Introduction(
      subTitleTextStyle: TextStyle(color: Colors.white,fontSize: 15,),
      titleTextStyle:TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold) ,
      title: 'Download and watch',
      imageHeight: 250,
      subTitle: 'Alwayse have something to watch offline',
      imageUrl: 'assets/images/onboarding2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width  ,
        child: IntroScreenOnboarding(
          skipTextStyle: TextStyle(color: Colors.black),
            backgroudColor: Colors.black,
            introductionList: list,
          onTapSkipButton: () async {
            final onboardingState = Provider.of<OnboardingState>(context, listen: false);
            onboardingState.setOnboardingShown(true);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboarding_shown', true);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
          },
     ),
      );

  }
}
class OnboardingState extends ChangeNotifier {
  bool _onboardingShown = false;

  bool get onboardingShown => _onboardingShown;

  void setOnboardingShown(bool value) {
    _onboardingShown = value;
    notifyListeners();
  }
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width:30,child: Image.asset("assets/images/netflixN.png")),
            TextButton(onPressed:() => Login(), child: Text("Login",style: TextStyle(color: Colors.white),),)
          ],
        ),

      ),
      body: TestScreen(),
    );
  }
}
