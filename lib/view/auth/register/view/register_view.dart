import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/view/auth/login/view/login_view.dart';
import 'package:rezervasyon/view/auth/register/view_model/register_view_model.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Enter Your Full Name',
                    labelText: 'Full Name',
                  ),
                  onChanged: (value) {
                    viewModel.updateRegisterModel(fullName: value);
                  },
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    hintText: 'Username',
                    labelText: 'Username',
                  ),
                  onChanged: (value) {
                    viewModel.updateRegisterModel(username: value);
                  },
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  onChanged: (value) {
                    viewModel.updateRegisterModel(email: value);
                  },
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
                  onChanged: (value) {
                    viewModel.updateRegisterModel(password: value);
                  },
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
                    labelText: 'Password Again',
                  ),
                  onChanged: (value) {
                    viewModel.updateRegisterModel(passwordAgain: value);
                  },
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                TextButton(
                  onPressed: () async {
                    await viewModel.register();
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginView()));
                      },
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
      ),
      onDispose: () {},
    );
  }
}
