import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/Screens/ComingSoon.dart';
import 'package:netflix_clone/Screens/DownloadScreen.dart';
import 'package:netflix_clone/Screens/MoreScreen.dart';
import 'package:netflix_clone/Screens/detailsScreen.dart';
import 'package:netflix_clone/Screens/homeScreen.dart';

import 'Screens/SearchScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
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

    //for fetching the data from firebase thses function is used
    Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('popular').get();
      return snapshot;
    }

    Future<QuerySnapshot<Map<String, dynamic>>> getAnimatedData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('popular').get();
      return snapshot;
    }

    Future<QuerySnapshot<Map<String, dynamic>>> getOriginalsData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('popular').get();
      return snapshot;
    }

    Future<QuerySnapshot<Map<String, dynamic>>> getRecommendedData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('popular').get();
      return snapshot;
    }

    Future<QuerySnapshot<Map<String, dynamic>>> getKidsData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('popular').get();
      return snapshot;
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
