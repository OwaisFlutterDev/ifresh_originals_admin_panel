import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ifresh_originals_admin_panel/constants/constants.dart';
import 'package:ifresh_originals_admin_panel/view/screens/admin_auth_screens/login_screen.dart';
import 'package:ifresh_originals_admin_panel/view/screens/home_screens/home_screen.dart';

Future<void> main() async {
  // await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAxs3OcDcw3TDHsTKRCOf1iDZrJIWLvjvg",
      authDomain: "ifresh-originals.firebaseapp.com",
      projectId: "ifresh-originals",
      storageBucket: "ifresh-originals.appspot.com",
      messagingSenderId: "1025870424779",
      appId: "1:1025870424779:web:c8dfa3ef27d323aa19094e",
      measurementId: "G-PCP4RCD1HX"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1920, 1080),
        minTextAdapt: true,
        builder: (context , child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            home: LoginScreen(),
          );
        }
    );

  }
}