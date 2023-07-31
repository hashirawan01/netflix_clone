import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix_clone/Screens/detailsScreen.dart';

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
      pageController.jumpTo(pagevalue);
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            leading: Image.asset('assets/images/logonetflix.png'),
            actions: [
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Tv Shows",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Movies",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "My List",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
                height: 230,
                child: Image.asset(
                  "assets/images/bg.jpg",
                  scale: 20.0,
                )),
          )),
          SliverToBoxAdapter(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: null,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/plus.png',
                        scale: 22.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "My List",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      )
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: null,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/play.png",
                          scale: 22.0,
                        ),
                        label: Text(
                          "Play",
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        ))),
              ),
              MaterialButton(
                  onPressed: null,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/info.png',
                        scale: 22.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Info",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      )
                    ],
                  )),
            ],
          )),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 40.0, top: 20.0, left: 10.0),
                    child: Text(
                      "Continue watching with Hashir Awan",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset('assets/images/bg.jpg'),
                              ),
                              LinearProgressIndicator(
                                value: 50,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: null,
                                    icon: Image.asset(
                                      'assets/images/info.png',
                                      scale: 22.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: null,
                                    icon: Image.asset(
                                      'assets/images/menu.png',
                                      scale: 22.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 100,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 150.0,
                                width: 150.0,
                                child: Image.asset('assets/images/bg.jpg'),
                              ),
                              LinearProgressIndicator(
                                value: 50,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: null,
                                    icon: Image.asset(
                                      'assets/images/info.png',
                                      scale: 22.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: null,
                                    icon: Image.asset(
                                      'assets/images/menu.png',
                                      scale: 22.0,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0),
                    child: Text(
                      "Popular on Netflix",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 109,
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getData(),
                      // Specify the type of data expected in the future builder
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset("assets/lottie/loading.json");
                          print("hellow bBY");
                        } else {
                          print("hellow bBY TWO");
                          final data = snapshot.data?.docs ??
                              []; // Use null-aware operator and null-coalescing operator to handle null case
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: null,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(data[index]
                                        ['image']), // Use null-aware operator
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0),
                    child: Text(
                      "Animated",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 109,
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getData(),
                      // Specify the type of data expected in the future builder
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset("assets/lottie/loading.json");
                          print("hellow bBY");
                        } else {
                          print("hellow bBY TWO");
                          final data = snapshot.data?.docs ??
                              []; // Use null-aware operator and null-coalescing operator to handle null case
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: null,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(data[index]
                                        ['image']), // Use null-aware operator
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0),
                    child: Text(
                      "Originals",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 109,
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getData(),
                      // Specify the type of data expected in the future builder
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset("assets/lottie/loading.json");
                          print("hellow bBY");
                        } else {
                          print("hellow bBY TWO");
                          final data = snapshot.data?.docs ??
                              []; // Use null-aware operator and null-coalescing operator to handle null case
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: null,
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(data[index]
                                        ['image']), // Use null-aware operator
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 190.0),
                    child: Text(
                      "Recommended",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 109,
                    child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      future: getData(),
                      // Specify the type of data expected in the future builder
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Lottie.asset("assets/lottie/loading.json");
                        } else {
                          print("hellow bBY TWO");
                          final data = snapshot.data?.docs ??
                              []; // Use null-aware operator and null-coalescing operator to handle null case
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: ()=>RoutToDetail(data[index]),
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(data[index]
                                        ['image']), // Use null-aware operator
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 350,
              child: Column(
                children: [
                  Text(
                    "Availible now : Season 2",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 250.0,
                    width: 300.0,
                    child: Image.asset("assets/images/bg2.jpg"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(5)),
                        child: TextButton.icon(
                            onPressed: null,
                            icon: Image.asset("assets/images/play.png",color: Colors.black,scale: 22.0,),
                            label: Text(
                              "play",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18.0,),
                            )),
                      ),
                      Container(
                        child: TextButton.icon(
                            onPressed: null,
                            icon: Image.asset("assets/images/plus.png",color: Colors.white,scale: 22.0,),
                            label: Text(
                              "My List",
                              style:
                              TextStyle(color: Colors.white, fontSize: 18.0,),
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  RoutToDetail(DocumentSnapshot info) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Detail(info: info,)));
  }
}
