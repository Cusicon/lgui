import 'package:flutter/material.dart';
import 'package:login_ui/screens/auth/login_page.dart';
import 'package:login_ui/screens/auth/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(showRegisterPage: togglePages)
        : RegisterPage(showLoginPage: togglePages);
  }
}
