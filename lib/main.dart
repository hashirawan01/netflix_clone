
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/Screens/ComingSoon.dart';
import 'package:netflix_clone/Screens/DownloadScreen.dart';
import 'package:netflix_clone/Screens/MoreScreen.dart';
import 'package:netflix_clone/Screens/SignInScreen.dart';
import 'package:netflix_clone/Screens/detailsScreen.dart';
import 'package:netflix_clone/Screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Login.dart';
import 'Screens/OnBoradingScreens.dart';
import 'Screens/SearchScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingShown = prefs.getBool('onboarding_shown') ?? false;
  bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => OnboardingState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix Clone',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        // home: const MyHomePage(title: 'Home'),
        // home: Login(),
        // home: onboardingShown ? MyHomePage(title: "Home") : OnBoarding(),
        home:onboardingShown ? (isLoggedIn ? MyHomePage(title: 'Home') : SignIn()) : OnBoarding(),
      ),
    ),
  );
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}





class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    PageController pageController = PageController();
    void ontap(pagevalue) {
      setState(() {
        selectedIndex = pagevalue;
      });
      pageController.jumpToPage(pagevalue);
    }
    
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.home, color: Colors.white),
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.search, color: Colors.white),
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.emoji_emotions, color: Colors.white),
              ),
              label: 'shorts'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.video_stable, color: Colors.white),
              ),
              label: 'Coming Soon'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Icon(Icons.download, color: Colors.white),
              ),
              label: 'Download')
        ],
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 12),
        selectedItemColor: Colors.white,
        onTap: ontap,
      ),
      body:PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          SearchScreen(),
          MoreScreen(),
          ComingSoon(),
          Download()


        ],
        onPageChanged: (value){
          setState(() {
            selectedIndex=value;
          });
        },
      )

    );
  }

  RoutToDetail(DocumentSnapshot info) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Detail(info: info,)));
  }
}
