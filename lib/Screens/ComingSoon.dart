import 'package:flutter/material.dart';
class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Coming Soon"),
      ),
      backgroundColor: Colors.black,
      body: Center(child: Text("Coming soon ",style:TextStyle(color: Colors.white))),
    );
  }
}
