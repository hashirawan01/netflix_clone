import 'package:flutter/material.dart';
import 'package:netflix_clone/Screens/SignInScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 80, child: Image.asset("assets/images/netflix.png")),
            TextButton(onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
            }, child: Text("Sign In" ,style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:38.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Ready To explore Unlimited Tv Programms & Films?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),maxLines: 2,),
            ),
            Padding(
              padding: const EdgeInsets.only(top:4.0,left: 8.0),
              child: Text("Create an account ,and we'll send you an email with everything you need to know about netflx",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),maxLines: 2,),
            ),


            Padding(
              padding: const EdgeInsets.only(left:18.0,right: 18.0,top: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.transparent,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: "Email Or Phone Number",
                      hintText: "Enter Username",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0,right: 18.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.transparent,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: "Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: Container(
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(color: Colors.white)
                ),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: () {


                    //  sign uo logic implements here
                    },
                    child: Text("CONTINUE",style: TextStyle(color: Colors.white,backgroundColor: Colors.transparent,fontWeight: FontWeight.bold),)
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
