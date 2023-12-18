import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_codeme/Views/Homepage.dart';

import '../Services/login.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernamectrl = TextEditingController();
  final TextEditingController Passwordctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 380,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(150)),
              ),
              child: Image.asset('assets/code.jpg',fit: BoxFit.cover,)
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 30.0,bottom: 5),
              child: Text('Sign in',style: TextStyle(color: Colors.blueAccent,fontSize: 18,fontWeight: FontWeight.w600),),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text('Welcome back! please enter your credential to login',style: TextStyle(fontSize: 10)),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        controller: usernamectrl,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 10,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 350,
                      child: TextFormField(
                        controller: Passwordctrl,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: const Icon(CupertinoIcons.eye_fill),
                          hintStyle: const TextStyle(fontSize: 10,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 200.0),
                    child: TextButton(onPressed: (){}, child: Text('Forgot your Password ?',style: TextStyle(fontSize: 10,color: Colors.black),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff000080),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        width: 350,
                        child: ElevatedButton(
                            style:  ElevatedButton.styleFrom(
                               backgroundColor:  const Color(0xff000080),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              final userName = usernamectrl.text;
                              final password = Passwordctrl.text;

                              if (userName.isNotEmpty && password.isNotEmpty) {
                                final response = await signIn(userName, password);
                                if (response == true) {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => Home()));
                                }
                                else{
                                  Fluttertoast.showToast(msg: 'Invalid Credentials');

                                }
                              }
                              else{
                                Fluttertoast.showToast(msg: 'All feilds required');
                              }
                            }, child: const Text('Sign In',style: TextStyle(color: Colors.white),)),
                      ),
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dont have any account?',style: TextStyle(fontSize: 12),),
                      TextButton(onPressed: (){},child: const Text('Sign Up',style: TextStyle(fontSize: 12)),),

                    ],
                  )
                ],
              ),
            ),

        ],),
      ),
    );
  }
}
