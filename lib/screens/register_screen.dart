import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newflutterproject/screens/login_screen.dart';
import 'package:newflutterproject/services/firebase_auth_service.dart';

import '../widgets/button.dart';
import '../widgets/customized_textfields.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpwdController = TextEditingController();

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
                child: Text("Welcome! \nPlease Register to Continue", style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              CustomizedTextfield(
                myController: _nameController,
                 hintText: "Name", 
                 isPassword: false,),
              CustomizedTextfield(
                myController: _emailController,
                 hintText: "Email Address", 
                 isPassword: false,),
              CustomizedTextfield(
                myController: _passwordController,
                 hintText: "Password", 
                 isPassword: true,),
                 CustomizedTextfield(
                myController: _confirmpwdController,
                 hintText: "Confirm Password", 
                 isPassword: true,),
                // const Align (
                //   alignment: Alignment.centerRight,
                //   child: Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Text("Forget Password?",
                //      style: TextStyle(
                //       color: Color(0xff6A707C),
                //       fontSize: 15,
                //      )),
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomizedButton(
                      buttonText: "Register",
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                       onPressed: () async {
                  try {
                    await FirebaseAuthService().signup(
                        _emailController.text.trim(),
                        _passwordController.text.trim());

                    if (!mounted) return;

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()));
                  } on FirebaseException catch (e) {
                    debugPrint(e.message);
                  }

                },
                      
                            ),
                  ), 
                ),

                const SizedBox(
                  height: 30,
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(70,8,8,8.0),
                  child: Row(
                    
                    children: [
                      Text("Already have an Account?",
                      style: TextStyle(
                        color: Color(0xff6A707C),
                        fontSize: 15,
                      )),
                      Text(" Login",
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