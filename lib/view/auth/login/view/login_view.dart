import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/view/auth/login/view_model/login_view_model.dart';

import '../../refresh_password/view/refresh_password_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 32,
              ),
              child: Form(
                // key: _formKey,
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
                        if (EmailValidator.validate(value)) {
                          viewModel.updateLoginModel(email: value);
                        } else {
                          viewModel.updateLoginModel(username: value);
                        }
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
                        viewModel.updateLoginModel(password: value);
                      },
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RefreshPasswordView())),
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        await viewModel.login();
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
                          onPressed: () {},
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
      onDispose: () {},
    );
  }
}
