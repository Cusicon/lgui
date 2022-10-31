import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screens/auth/auth_page.dart';
import 'package:login_ui/screens/pages/home_page.dart';

class PageSwitcher extends StatelessWidget {
  const PageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return snapshot.hasData ? const HomePage() : const AuthPage();
        },
      ),
    );
  }
}
