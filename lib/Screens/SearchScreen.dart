import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<QuerySnapshot<Map<String,dynamic>>>getData() async{
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firestore.collection('search').get();
    return snapshot;
  }
  //for fetching the data from firebase thses function is used

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(
          Icons.search,
          color: Colors.white,
        ),
        title: TextField(
          decoration: InputDecoration(
              hintText: "Search For a movie show,",
              hintStyle: TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.mic,
                    color: Colors.grey,
                  ))),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "POPULAR MOVIES",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top:16.0),
              child: SizedBox(
                height: 590,
                child:  FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  future: getData(),
                  // Specify the type of data expected in the future builder
                  builder: (context, snapshot) {
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Lottie.asset("assets/lottie/animation.json");
                      print("hellow bBY");
                    } else {
                      print("hellow bBY TWO");
                      final data = snapshot.data?.docs ??
                          []; // Use null-aware operator and null-coalescing operator to handle null case
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          final docData = data[index].data();
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              decoration: BoxDecoration( color: Colors.blueGrey),
                              child: GestureDetector(
                                onTap: null,
                                child: SizedBox(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 200,
                                        child: Image.network(data[index]
                                        ['image'],fit: BoxFit.fitWidth,), // Use null-aware operator
                                      ),
                                      Container(
                                        width: 100, child: Padding(
                                          padding: const EdgeInsets.only(left:8.0),
                                          child: Text( docData['name']
                                      ,style: TextStyle(color: Colors.white,fontSize: 18.0),),
                                        ),
                                      ),
                                      Icon(Icons.play_arrow,color: Colors.grey,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
