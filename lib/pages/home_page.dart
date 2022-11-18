import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docIds = [];

  Future getDocID() async {
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((element) { 
              print(element.reference);

            }));
  }

  @override

  void initState(){
    getDocID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Signed In as ${user.email!}'),
              MaterialButton(onPressed:(){
                FirebaseAuth.instance.signOut();
              },
              color: Colors.blueAccent,
                child: const Text('Sign Out'),
              )
            ],
          )),
    );
  }
}
