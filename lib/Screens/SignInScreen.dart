import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:netflix_clone/Screens/Login.dart';
import 'package:netflix_clone/Screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}
final _auth = FirebaseAuth.instance;

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String email;
  late String password;
  bool showSpinner = false;
  bool isLoggedIn = false;
  Future<void> saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 80, child: Image.asset("assets/images/netflix.png")),
                TextButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                }, child: Text("Sign Up" ,style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 188.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.blueGrey,
                        child: TextFormField(
                          onChanged: (value) {
                            email = value;
                            //Do something with the user input.
                          },
                          textAlign: TextAlign.center,
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            labelText: "Email Or Phone Number",
                            hintText: "Enter Username",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.blueGrey,
                        child: TextFormField(
                          onChanged: (value) {
                            password = value;
                            //Do something with the user input.
                          },
                          textAlign: TextAlign.center,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: "Password",
                            hintText: "Enter Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white)
                        ),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                          ),
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user = await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                                if (user != null) {
                                  await saveLoginStatus();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                }
                              } catch (e) {
                                print(e);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error: $e')),
                                );
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            },

                            child: Text("Sign In",style: TextStyle(color: Colors.white,backgroundColor: Colors.transparent),)
                        ),
                      ),
                    ),
                    TextButton(onPressed: null, child: Text("Need Help",style: TextStyle(color: Colors.white),)),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                    }, child: Text("New To Netflix Sign Up Now",style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}


