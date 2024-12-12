import 'package:bt/consts/consts.dart';
import 'package:bt/firebase_options.dart';
import 'package:bt/res/components/waiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Load environment variables from the .env file
    await dotenv.load(fileName: ".env");


    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    runApp(const MyApp());
  } catch (e) {
    print("Error during app initialization: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: WaitingScreen(),
    );
  }
}
