import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/Login.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            SizedBox(width:30,child: Image.asset("assets/images/netflixN"))
            ,
            TextButton(onPressed: ()=>Login(), child: Text("Sign Up"))
          ],
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            
          )
        ],
      ),
    );
  }
}
