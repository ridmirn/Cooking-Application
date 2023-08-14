import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newflutterproject/screens/forgot_password.dart';
import 'package:newflutterproject/screens/new_screen.dart';
import 'package:newflutterproject/screens/recipe_detail_screen.dart';
import 'package:newflutterproject/screens/register_screen.dart';
import 'package:newflutterproject/services/firebase_auth_service.dart';
import 'package:newflutterproject/widgets/customized_textfields.dart';

import '../widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context){

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(icon: Icon(Icons.arrow_back_ios_sharp), onPressed: (){
                    Navigator.pop(context);
                  }),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Welcome! \nPlease Login to Continue", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              CustomizedTextfield(
                myController: _emailController,
                 hintText: "Enter your Email", 
                 isPassword: false,),
              CustomizedTextfield(
                myController: _passwordController,
                 hintText: "Enter your Password", 
                 isPassword: true,),
                Align (
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                      },
                      child: const Text("Forgot Password?",
                       style: TextStyle(
                        color: Color(0xff6A707C),
                        fontSize: 15,
                       )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomizedButton(buttonText: "Login",
                              buttonColor: Colors.black,
                              textColor: Colors.white,
                              onPressed: () async {
                                try {
                                  await FirebaseAuthService().login(_emailController.text.trim(), _passwordController.text.trim());
                                  if (FirebaseAuth.instance.currentUser != null){
                                    if (!mounted) return;

                                  
                                  Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => HomePage()));

                                  }
                                 
                                }on FirebaseAuthException catch (e){
                                  debugPrint("error is ${e.message}");

                                  showDialog(
                                    context: context, 
                                    builder: (context)=> AlertDialog(
                                      title: const Text(
                                        "Invalide username or password"
                                      ),
                                      actions: [
                                        ElevatedButton(
                                        child:const Text("Register Now"),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                                        },)
                                      ],
                                    ));


                                }
                              },


                            ),
                  ), 
                ),

                const SizedBox(
                  height: 70,
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(70,8,8,8.0),
                  child: Row(
                    
                    children: [
                      Text("Don't have an account?",
                      style: TextStyle(
                        color: Color(0xff6A707C),
                        fontSize: 15,
                      )),
                      Text(" Register",
                      style: TextStyle(
                        color: Color(0xffE55451),
                        fontSize: 15,
                      )),
                    ],
                  ),
                )


                ],
              ),
          ),
          ),
        ),
      );
    
  }
}