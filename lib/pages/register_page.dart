import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_login/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final  _emailController = TextEditingController();
  final  _passwordController = TextEditingController();
  final  _confirmPasswordController = TextEditingController();
  final  _firstNameController = TextEditingController();
  final  _lastNameController = TextEditingController();
  final  _ageController = TextEditingController();


  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    //authenticate user
    if(passwordConfirmed()){
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:  _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      //add user details
      addUserDetails(
        _firstNameController.text.trim(),
        _lastNameController.text.trim(),
        _emailController.text.trim(),
        _ageController.text.trim(),
      );
    }
  }
  Future addUserDetails(String firstName,String lastName,String email,String age) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name':firstName,
      'last name':lastName,
      'email':email,
      'age':age,
    });
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim()==_confirmPasswordController.text.trim()){
      return true;
    }else{
      return false;
    }
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
                  Text('Hello there',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),
                  const SizedBox(height: 10),

                  const Text('Register below',
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
                          controller: _firstNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
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
                          controller: _lastNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
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
                          controller: _ageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Age',
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
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap:signUp,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:const Center(
                          child: Text('Sign Up',
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
                      const Text('I am a member?',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));},
                        child: const Text('Login now',
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
