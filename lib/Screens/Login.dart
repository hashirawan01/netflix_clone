import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: SizedBox(width:90,child: Center(child: Image.asset("assets/images/netflix.png")))),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:108.0),
            child: Center(child: Text("Who's Watching?",style: TextStyle(color: Colors.white,fontSize: 18),)),
          ),
          Padding(
            padding: const EdgeInsets.only(top:28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      SizedBox(width:80,child: Image(image: AssetImage("assets/images/man.png"))),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text("HAshir",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Column(
                    children: [
                      SizedBox(width:80,child: Image(image: AssetImage("assets/images/man.png"))),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("HAshir",style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:58.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      SizedBox(width:80,child: Image(image: AssetImage("assets/images/man.png"))),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text("HAshir",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                    children: [
                      SizedBox(width:80,child: Image(image: AssetImage("assets/images/man.png"))),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("HAshir",style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )

              ],
            ),
          )

        ],
      ),
    );
  }
}
