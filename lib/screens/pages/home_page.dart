// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Dashboard'),
              Text('${user!.email}'),
              SizedBox(height: 20.0),
              OutlinedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
