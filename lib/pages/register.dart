import 'package:flutter/material.dart';
import 'package:rezervasyon/pages/login.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key, required this.onSuccessfulSignUp}) : super(key: key);
  VoidCallback onSuccessfulSignUp;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/signup.png',
              fit: BoxFit.cover,
              height: 300,
              width: 350,
            ),
            const SizedBox(
              height: 20,
              width: 20,
            ),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Courier',
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
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
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Enter Your Full Name',
                        labelText: 'Full Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Email/Username',
                        labelText: 'Email or Username',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        _formKey.currentState!.validate() ? widget.onSuccessfulSignUp() : null;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 35,
                        child: const Text(
                          'Sign Up',
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
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        onSuccessfulLogin: widget.onSuccessfulSignUp,
                                      )),
                            );
                          }),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const Text(
                      'By signing up you agree to our terms, conditions and privacy Policy.',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
