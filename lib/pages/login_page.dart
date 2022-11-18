
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_login/pages/register_page.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Future signIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
  );
}
  @override
  void dispose(){
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white70,
        body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.android,
                    size: 100
                    ),
                    const SizedBox(height: 20),
                     Text('Hello there.....!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                    ),
                    const SizedBox(height: 10),

                    const Text('Welcome back, you\'ve been missed..!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding:const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding:const EdgeInsets.only(left:20.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'password',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GestureDetector(
                          onTap:signIn,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                            child:const Center(
                              child: Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        const Text('Not a member? ',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (RegisterPage())));
                          },
                          child: const Text('Register now',
                            style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )),
      );
  }
}
