import 'package:flutter/material.dart';
import 'package:rezervasyon/core/base/widget/base_view.dart';
import 'package:rezervasyon/view/auth/refresh_password/view_model/refresh_password_view_model.dart';

import '../../../../core/base/state/base_view_state.dart';

class RefreshPasswordView extends StatefulWidget {
  RefreshPasswordView({Key? key}) : super(key: key);

  @override
  State<RefreshPasswordView> createState() => _RefreshPasswordViewState();
}

class _RefreshPasswordViewState extends BaseViewState<RefreshPasswordView> {
  late RefreshPasswordViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<RefreshPasswordViewModel>(
      viewModel: RefreshPasswordViewModel(),
      onModelReady: (model) {
        viewModel = model;
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, model) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                controller: viewModel.emailController,
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              TextButton(
                onPressed: viewModel.sendPasswordEmail,
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 35,
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              TextButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 35,
                  child: const Text(
                    'Return Home',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onDispose: () {},
    );
  }
}
