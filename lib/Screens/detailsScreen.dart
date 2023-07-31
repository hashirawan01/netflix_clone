import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Detail extends StatefulWidget {
  final DocumentSnapshot info;

  const Detail({Key? key, required this.info}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final data = widget.info.data() as Map<String, dynamic>?;
    ;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: SizedBox(
                        height: 250.0,
                        width: 150.0,
                        child: Image.network(
                          data?['image'] ?? '',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data?['match'],
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data?['year'],
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(2)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  data?['age'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          data?['season'],
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 35.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.black87,
                            ),
                            label: Text(
                              "Play",
                              style: TextStyle(color: Colors.black87),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 35.0,
                        width: 400.0,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade500.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton.icon(
                            onPressed: null,
                            icon: Image.asset(
                              "assets/images/download.png",
                              color: Colors.white,
                            ),
                            label: Text(
                              "Download",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.black87, BlendMode.darken),
                        image: NetworkImage(
                          data?['image'] ?? '',
                        ))),
              ),
            ),
            expandedHeight: 600.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: 'Detail',
                            )));
              },
            ),
          )
        ],
      ),
    );
  }
}
