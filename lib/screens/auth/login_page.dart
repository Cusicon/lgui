import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:login_ui/screens/auth/forgot_password_page.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Key _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisible = true;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 10.0),
                Column(
                  children: [
                    const Icon(
                      Icons.waving_hand_outlined,
                      size: 36,
                    ),
                    Text(
                      'Hello Again!',
                      style: GoogleFonts.bebasNeue(fontSize: 48.0),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "Welcome back, you've been missed.",
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              !isEmail(value!) ? 'Invalid email address' : null,
                          controller: _emailController,
                          decoration: ThemeHelper().textInputDecoration(
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _passwordVisible,
                          decoration: ThemeHelper().passwordInputDecoration(
                            hintText: 'Password',
                            suffixMethod: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ForgotPasswordPage();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          onTap: signIn,
                          child: ThemeHelper()
                              .authSubmitButton(context, 'Sign In'),
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Need a membership? '),
                            GestureDetector(
                              onTap: widget.showRegisterPage,
                              child: Text(
                                'Sign up.',
                                style: TextStyle(
                                  color: Colors.blue.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
