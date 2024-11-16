import 'dart:math';

import 'package:bt/consts/consts.dart';
import 'package:bt/controllers/appointment_controller.dart';
import 'package:bt/controllers/auth_controller.dart';
import 'package:bt/views/appointment_details_view/appointment_detail_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  final bool isElectrician;
  const AppointmentView({super.key , this.isElectrician = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: "Appointments",color:AppColors.whitecolor,size: AppSizes.size18 ),
        actions: [
          IconButton(onPressed: (){
                AuthController().signout();
          }, icon: Icon(Icons.power_settings_new_rounded))
        ],
      ),
      body:FutureBuilder(
          future: controller.getAppointments(isElectrician),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              var data = snapshot.data?.docs;
              return  Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index){
                      return ListTile(
                        onTap: (){
                          Get.to(()=>AppointmentDetailView(Elec: data[index],));
                        },
                        leading: CircleAvatar(child: Image.asset(AppAssets.icSignup),),
                        title: AppStyles.bold(title: data![index][!isElectrician ? 'appWithName' : 'appName']),
                        subtitle: AppStyles.normal(title: "${data[index]['appDay']} - ${data[index]['appTime']}",color: AppColors.textcolor.withOpacity(0.5)),

                      );
                    }),
              );
            }
          },
      ),
    );
  }
}
