import 'package:bt/consts/consts.dart';

import '../../res/components/custom_textfield.dart';

class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: "Doctor Name",color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             AppStyles.bold(title: "Select appointment day"),
             5.heightBox,
             AppStyles.normal(title: "Selected Day"),
             10.heightBox,
             AppStyles.bold(title: "Select appointment time"),
             5.heightBox,
             AppStyles.normal(title: "Selected Time"),
             20.heightBox,
             AppStyles.bold(title: "Mobile Number"),
             5.heightBox,
             AppStyles.normal(title: "Mobile Number"),
             10.heightBox,
             AppStyles.bold(title: "Fullname"),
             5.heightBox,
             AppStyles.normal(title: "Name"),
             10.heightBox,
             AppStyles.bold(title: "Message:"),
             5.heightBox,
             AppStyles.normal(title: "Message"),
           ],
        ),
      ),
    );
  }
}
