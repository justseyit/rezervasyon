import 'package:rezervasyon/pages/privacy_policy.dart';
import 'package:rezervasyon/pages/settings.dart';
import 'package:rezervasyon/pages/team.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.isColorBlack}) : super(key: key);

  final bool isColorBlack;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    precacheImage(AssetImage('assets/images/bannerlogo.png'), context);
    return Drawer(
      child: Material(
        elevation: 10,
        child: Container(
          width: size.width / 2,
          height: size.height,
          child: Column(
            children: [
              SizedBox(
                height: size.height * (1 / 15),
              ),
              Container(
                width: size.width / 1.5,
                height: size.height * 1 / 16,
                child: Image.asset(
                  'assets/images/bannerlogo.png',
                  //scale: size.width / (size.width * .50),
                  //fit: BoxFit.fill,
                  color: isColorBlack == true ? Colors.black : Colors.white,
                ),
              ),
              SizedBox(
                height: size.height * (1 / 20),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings_outlined,
                  size: 35,
                ),
                title: Text(
                  'Ayarlar',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => SettingsPage()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                  size: 35,
                ),
                title: Text(
                  'Künye',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => Team()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  size: 35,
                ),
                title: Text(
                  'Gizlilik Politikası',
                  style: TextStyle(fontSize: 25),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
