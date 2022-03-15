import 'package:flutter/material.dart';

enum AppBarType { Menu, Back }

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.appBarType, this.onButtonTap, required this.isColorBlack}) : super(key: key);

  final AppBarType appBarType;
  final void Function()? onButtonTap;
  final bool isColorBlack;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    precacheImage(AssetImage('assets/images/bannerlogo.png'), context);
    switch (appBarType) {
      case AppBarType.Menu:
        return Container(
          width: size.width,
          height: size.height * (2.6 / 16),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 16,
              ),
              Container(
                width: size.width * .95,
                height: size.height * (1.1 / 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      iconSize: 30,
                      onPressed: onButtonTap ?? () {},
                    ),
                    Image.asset(
                      'assets/images/bannerlogo.png',
                      scale: size.width / (size.width * .75),
                      color: isColorBlack == true ? Colors.black : Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 32,
              ),
            ],
          ),
        );

      case AppBarType.Back:
        return Container(
          width: size.width,
          height: size.height * (2.6 / 16),
          child: Column(
            children: [
              SizedBox(
                height: size.height / 16,
              ),
              Container(
                width: size.width * .95,
                height: size.height * (1.1 / 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      onPressed: onButtonTap ?? () => Navigator.of(context).pop(),
                    ),
                    Image.asset(
                      'assets/images/bannerlogo.png',
                      scale: size.width / (size.width * .75),
                      color: isColorBlack == true ? Colors.black : Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 32,
              ),
            ],
          ),
        );
    }
  }
}
