import 'package:flutter/material.dart';
import 'package:newflutterproject/screens/register_screen.dart';
import 'package:newflutterproject/widgets/button.dart';
import 'package:newflutterproject/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
       
        height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
       width:double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assests/Screen 1.png" ),
           
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 40),
            CustomizedButton(buttonText: "Login",
            buttonColor: Colors.black,
            textColor: Colors.white,
             onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
          ),
            CustomizedButton(buttonText: "Register",
            buttonColor: Colors.white,
            textColor: Colors.black,
             onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()));
              },
          ),

          // const SizedBox(height: 20),
          // const Padding(
          // padding: EdgeInsets.all(10.0),
          // child: Text(
          //   "Contiue as a Guest",
          // style: TextStyle(color: Color(0xE55451), fontSize: 25),
          // ),)

          ],
        ),
    
      ),
    );
  }
}