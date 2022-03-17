//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:rezervasyon/blocs/corner_post/corner_post_bloc.dart';
import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/firebase_options.dart';
import 'package:rezervasyon/pages/home_screen.dart';
import 'package:rezervasyon/pages/login.dart';
import 'package:rezervasyon/pages/page_handler.dart';
import 'package:rezervasyon/production/providers/user_provider.dart';
import 'package:rezervasyon/service_locator.dart';
//import 'package:rezervasyon/utils/token_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:rezervasyon/view/auth/login/view/login_view.dart';
import 'package:rezervasyon/view/auth/register/view/register_view.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/news/news_bloc.dart';

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
  setupLocator();
  await getPrefs();
  runApp(MyApp());
}

getPrefs() async {
  preferences = await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demokrasi Gazetesi',
        theme: ThemeData.dark(),
        home: RegisterView(),
      ),
    );
  }
}
