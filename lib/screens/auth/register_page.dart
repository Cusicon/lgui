import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Key _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _passwordVisible = true;
  bool _conPasswordVisible = true;

  bool passwordConfirmed() {
    if (_passwordController.text == _confirmPasswordController.text) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
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
                      Icons.waving_hand_rounded,
                      size: 36,
                    ),
                    Text(
                      'Hello!',
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
                          'Register your details below to continue.',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) => !isEmail(value!)
                                ? 'Invalid email address'
                                : null,
                            controller: _emailController,
                            decoration: ThemeHelper().textInputDecoration(
                              hintText: 'Email',
                            )),
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
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _conPasswordVisible,
                          decoration: ThemeHelper().passwordInputDecoration(
                            hintText: 'Repeat Password',
                            suffixMethod: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _conPasswordVisible = !_conPasswordVisible;
                                });
                              },
                              child: Icon(
                                _conPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: signUp,
                          child: ThemeHelper()
                              .authSubmitButton(context, 'Sign Up'),
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already a member? '),
                            GestureDetector(
                              onTap: widget.showLoginPage,
                              child: Text(
                                'Sign in.',
                                style: TextStyle(
                                  color: Colors.blue[600],
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
