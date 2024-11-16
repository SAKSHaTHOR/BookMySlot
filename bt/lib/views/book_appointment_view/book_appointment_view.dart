import 'package:bt/consts/consts.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:get/get.dart';

import '../../controllers/appointment_controller.dart';

class BookAppointmentView extends StatelessWidget {
  final String ElecId;
  final String ElecName;
  const BookAppointmentView({super.key,required this.ElecId,required this.ElecName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: ElecName,color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select appointment day"),
              5.heightBox,
               CustomTextfield(hint: "Select Day",textController: controller.appDayController,),
              10.heightBox,
              AppStyles.bold(title: "Select appointment time"),
              5.heightBox,
               CustomTextfield(hint: "Select time",textController: controller.appTimeController,),
              20.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              5.heightBox,
               CustomTextfield(hint: "Enter Your MObile number",textController: controller.appMobileController,),
             10.heightBox,
              AppStyles.bold(title: "Fullname"),
              5.heightBox,
               CustomTextfield(hint: "Enter your Name",textController: controller.appNameController,),
              10.heightBox,
              AppStyles.bold(title: "Message:"),
              5.heightBox,
               CustomTextfield(hint: "Enter your message",textController: controller.appMessageController,),
            ],
          ),
        ),
      ),
      bottomNavigationBar:Obx(()=> Padding(
          padding: const EdgeInsets.all(12.0),
          child: controller.isLoading.value ?
          const Center(
            child: CircularProgressIndicator(),
          ):
          CustomButton(
            buttonText: "Book an appointment",
            onTap: () async{
              await controller.bookAppointment(ElecId, ElecName,context);

            },
          ),
        ),
      ),
    );
  }
}
