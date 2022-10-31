// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final Key _formKey = GlobalKey<FormState>();

  Future passwordReset() async {
    try {
      String email = _emailController.text.trim();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Link sent! Check your email.'),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${e.message}'),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Enter your email and we will send you a link to reset your password.',
                ),
                const SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            !isEmail(value!) ? 'Invalid email address' : null,
                        controller: _emailController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(20.0),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.purple.shade200, width: 1.5),
                              borderRadius: BorderRadius.circular(12)),
                          border: InputBorder.none,
                          hintText: 'Email',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      OutlinedButton(
                        onPressed: passwordReset,
                        child: const Text('Reset Password'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
