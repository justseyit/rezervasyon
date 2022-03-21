//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rezervasyon/firebase_options.dart';
import 'package:rezervasyon/production/providers/user_provider.dart';
//import 'package:rezervasyon/utils/token_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:rezervasyon/view/home/main/view/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/start/theme/theme_notifier.dart';

late final SharedPreferences preferences;
final FirebaseMessaging fcm = FirebaseMessaging.instance;
//final FirebaseFirestore fs = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //NotificationSettings settings = await fcm.requestPermission();
  /*String? token = await fcm.getToken();
  if (token != null) {
    TokenManager.token = token;
    await TokenManager.setToken(token);
  } else {
    String? token = await fcm.getToken();
    TokenManager.token = token;
    await TokenManager.setToken(token);
  }*/

  //MobileAds.instance.initialize();
  await getPrefs();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: MyApp(),
  ));
}

getPrefs() async {
  preferences = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demokrasi Gazetesi',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeProvider>().getTheme,
      home: MainView(),
    );
  }
}
