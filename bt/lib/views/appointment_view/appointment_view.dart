import 'package:bt/consts/consts.dart';
import 'package:bt/views/appointment_details_view/appointment_detail_view.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: "Appointments",color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
             itemCount: 4,
            itemBuilder: (BuildContext context, int index){
               return ListTile(
                 onTap: (){
                   Get.to(()=>AppointmentDetailView());
                 },
                 leading: CircleAvatar(child: Image.asset(AppAssets.icSignup),),
                 title: AppStyles.bold(title: "Doctor Name"),
                 subtitle: AppStyles.normal(title: "Appointment time",color: AppColors.textcolor.withOpacity(0.5)),

               );
            }),
      ),
    );
  }
}
