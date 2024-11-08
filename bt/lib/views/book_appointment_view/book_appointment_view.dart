import 'package:bt/consts/consts.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:get/get.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: "Electrician Name",color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Select appointment day"),
              5.heightBox,
              const CustomTextfield(hint: "Select Date"),
              10.heightBox,
              AppStyles.bold(title: "Select appointment time"),
              5.heightBox,
               const CustomTextfield(hint: "Select time"),
              20.heightBox,
              AppStyles.bold(title: "Mobile Number"),
              5.heightBox,
              const CustomTextfield(hint: "Enter Your MObile number"),
             10.heightBox,
              AppStyles.bold(title: "Fullname"),
              5.heightBox,
              const CustomTextfield(hint: "Enter your Name"),
              10.heightBox,
              AppStyles.bold(title: "Message:"),
              5.heightBox,
              const CustomTextfield(hint: "Enter your message"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          buttonText: "Book an appointment",
          onTap: (){},
        ),
      ),
    );
  }
}
