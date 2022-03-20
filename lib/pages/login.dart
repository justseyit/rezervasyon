import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rezervasyon/pages/register.dart';
import 'package:rezervasyon/pages/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.onSuccessfulLogin}) : super(key: key);

  VoidCallback onSuccessfulLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/bannerlogo.png',
                fit: BoxFit.cover,
                color: Colors.black,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Welcome!',
                      textStyle: const TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.w500,
                      ),
                      speed: const Duration(
                        milliseconds: 450,
                      )),
                ],
                onTap: () {
                  debugPrint("Welcome back!");
                },
                isRepeatingAnimation: true,
                totalRepeatCount: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (email) {
                          return EmailValidator.validate(email ?? '')
                              ? null
                              : 'Invalid Email';
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          hintText: 'Enter Your Username/Email',
                          labelText: 'Email or Username',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword(
                                    onSuccessfulSignin:
                                        widget.onSuccessfulLogin)),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _formKey.currentState!.validate()
                              ? widget.onSuccessfulLogin()
                              : null;
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 35,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp(
                                          onSuccessfulSignUp:
                                              widget.onSuccessfulLogin,
                                        )),
                              );
                            }),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
