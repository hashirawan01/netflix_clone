import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    final condition = "on";
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Row(
          children: [
            IconButton(
                onPressed: null, icon: Image.asset("assets/images/info.png")),
            Text(
              "Smart Download ",
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                condition,
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:150.0),
                child: Image.asset(
                  "assets/images/download.png",
                  scale: 3.0,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Center(child: Text("Movies that you Download appear here")),
              ),
              Padding(
                padding: const EdgeInsets.only(top:58.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius: BorderRadius.circular(5),
                  ),
                  child: MaterialButton(

                    onPressed: null,child: Text(
                    "find Something to download",style: TextStyle(color: Colors.black,fontSize: 18.0),
                  ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
