import 'package:bt/consts/consts.dart';
import 'package:bt/views/appointment_view/appointment_view.dart';
import 'package:bt/views/category_view/category_view.dart';
import 'package:bt/views/home_view/home_view.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:bt/views/settings_view/settings_view.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex=0;
  List screenList = [
    const HomeView(),
     const AppointmentView(),
    const CategoryView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.whitecolor.withOpacity(0.5),
        selectedItemColor: AppColors.whitecolor,
        selectedLabelStyle: TextStyle(
          color: AppColors.whitecolor,
        ),
        selectedIconTheme: IconThemeData(
          color: AppColors.whitecolor,
        ),
        backgroundColor: AppColors.bluecolor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex=value;
          });
        },
        items: const[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "Appointments"),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),

        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
      ],),
    );
  }
}
