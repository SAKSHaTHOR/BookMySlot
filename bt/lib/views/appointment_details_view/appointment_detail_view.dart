import 'package:bt/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../res/components/custom_textfield.dart';



class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot Elec;

  const AppointmentDetailView({super.key,required this.Elec});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: Elec['appWithName'],color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AppStyles.bold(title: "Select appointment day"),
             5.heightBox,
             AppStyles.normal(title: Elec['appDay']),
             10.heightBox,
             AppStyles.bold(title: "Select appointment time"),
             5.heightBox,
             AppStyles.normal(title: Elec['appTime']),
             20.heightBox,
             AppStyles.bold(title: "Mobile Number"),
             5.heightBox,
             AppStyles.normal(title: Elec['appMobile']),
             10.heightBox,
             AppStyles.bold(title: "Fullname"),
             5.heightBox,
             AppStyles.normal(title: Elec['appName']),
             10.heightBox,
             AppStyles.bold(title: "Message:"),
             5.heightBox,
             AppStyles.normal(title: Elec['appMsg']),
           ],
        ),
      ),
    );
  }
}
