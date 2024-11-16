import 'package:bt/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var searchQueryController =TextEditingController();
   var isLoading = false.obs;

  Future<QuerySnapshot<Map<String,dynamic>>> getElectricianList() async{
     var electricians = await FirebaseFirestore.instance.collection('Electricians').get();
      return electricians;
   }
}