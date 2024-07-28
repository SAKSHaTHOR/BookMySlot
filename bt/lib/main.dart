import 'package:bt/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bt/views/login_view/login_view.dart';


void main(){
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
