import 'package:bt/consts/consts.dart';
import 'package:bt/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
