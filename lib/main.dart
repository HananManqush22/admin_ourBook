import 'dart:io';
import 'package:admin_ourbook/screen/splacePage.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyAzuQZ1ddeYMsOyhBiX_dKxEy2zn2FdvyY",
              appId: "1:28426391389:android:4a79f9f2e2f6b26d2562b4",
              messagingSenderId: "28426391389",
              projectId: "ourbook-8974f",
              storageBucket: "ourbook-8974f.appspot.com"))
      : await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
    ));
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,

        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplaceScreen(),
          );
        });
  }
}
