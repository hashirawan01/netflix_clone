import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    int selectedIndex=0;
    void ontap(pagevalue){
      setState(() {
        selectedIndex=pagevalue;
      });

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home,color: Colors.white),
                ),
              label: 'home'
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.search,color: Colors.white),
                ),
                label: 'Search'
            ),
            BottomNavigationBarItem(

                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.emoji_emotions,color: Colors.white),
                ),
                label: 'shorts'
            ),
            BottomNavigationBarItem(

                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.video_stable,color: Colors.white),
                ),
                label: 'Coming Soon'
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.download,color: Colors.white),
                ),
                label: 'Download'
            )
          ],
          unselectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(fontSize: 12),
      selectedItemColor: Colors.white,
      ),
    );
  }
}
