import 'package:bt/views/appointment_view/appointment_view.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';
import '../views/home_view/home.dart';

class AuthController extends GetxController{
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
 //editing controller

  var aboutController = TextEditingController();
  var addressController = TextEditingController();
  var servicesController = TextEditingController();
  var timingController = TextEditingController();
  var phoneController = TextEditingController();
  var categoryController = TextEditingController();



  UserCredential? userCredential;

  isUserAlreadyLoggedIn() async{
    await FirebaseAuth.instance.authStateChanges().listen((User? user)async{
      if(user != null) {
       var data = await FirebaseFirestore.instance.collection('Electricians').doc(user.uid).get();
        var isElec = data.data()?.containsKey('ElecName') ?? false;

        if(isElec){
          Get.offAll(()=>AppointmentView());
        }
        else {
          Get.offAll(() => Home());
        }
      }else{
        Get.offAll(()=>const LoginView());
      }
    });
  }

  loginUser() async{
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text,);
  }

   signupUser(bool isElectrician ) async{
     userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
     if(userCredential != null){
       await storeUserData(userCredential!.user!.uid,fullnameController.text,emailController.text,isElectrician);
     }
   }

   storeUserData(String uid,String fullname,String email,bool isElectrician)async{
     var store = FirebaseFirestore.instance.collection(isElectrician ? 'Electricians' : 'users').doc(uid);
     if(isElectrician){
       await store.set({
          'ElecAbout': aboutController.text,
          'ElecAddress' : addressController.text,
         'ElecCategory' : categoryController.text,
          'ElecName':fullname,
         'ElecPhone' : phoneController.text,
         'ElecServices' : servicesController.text,
         'ElecTiming':timingController.text,
          'ElecId' : FirebaseAuth.instance.currentUser?.uid,
            'ElecRating':1,
         'ElecEmail' : email,
       });
     }else {
       await store.set({
         'fullname': fullname,
         'email': email,
       });
     }
   }
  signout() async{
    await FirebaseAuth.instance.signOut();
  }

}