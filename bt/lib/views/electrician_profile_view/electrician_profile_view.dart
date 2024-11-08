import 'package:bt/consts/consts.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/views/book_appointment_view/book_appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ElectricianProfileView extends StatelessWidget {
  const ElectricianProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.bluecolor,
          title: AppStyles.bold(title: "Electrician detail",color:AppColors.whitecolor,size: AppSizes.size18 ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                child: Row(

                  children: [
                    CircleAvatar(
                      radius:35,
                      child: Image.asset(AppAssets.icSignup),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           AppStyles.bold(title: "Electrician Name",color:AppColors.textcolor,size: AppSizes.size14 ),
                          AppStyles.bold(
                              title: "Category",color:AppColors.textcolor.withOpacity(0.5),size: AppSizes.size12 ),
                           const Spacer(),
                          VxRating(
                               selectionColor: AppColors.yellowColor,
                                onRatingUpdate: (value){},
                              maxRating: 5,
                                count: 5,
                                value: 4,
                                stepInt: true,
                            )
                        ],
                      ),
                    ),
                    AppStyles.bold(title: "See all reviews",color:AppColors.bluecolor,size: AppSizes.size12 ),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.whitecolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        title: AppStyles.bold(title: "Phone Number",color: AppColors.textcolor),
                        subtitle: AppStyles.normal(title: "+9994933921",color: AppColors.textcolor.withOpacity(0.5),size:AppSizes.size12 ),
                        trailing: Container(
                            width: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.yellowColor,
                            ),
                            child: Icon(Icons.phone,color: AppColors.whitecolor,
                            )),
                    ),
                    10.heightBox,

                    AppStyles.bold(title: "About",color: AppColors.textcolor,size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: "This is the about section of a Electrician",
                        color: AppColors.textcolor.withOpacity(0.5),
                        size: AppSizes.size12
                    ),
                    10.heightBox,
                    AppStyles.bold(title: "Address",color: AppColors.textcolor,size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: "Address of the Electrician",
                        color: AppColors.textcolor.withOpacity(0.5),
                        size: AppSizes.size12
                    ),
                    10.heightBox,
                    AppStyles.bold(title: "Working Time",color: AppColors.textcolor,size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: "9:00 AM to 12:00 PM",
                        color: AppColors.textcolor.withOpacity(0.5),
                        size: AppSizes.size12
                    ),
                    10.heightBox,
                    AppStyles.bold(title: "Services",color: AppColors.textcolor,size: AppSizes.size16),
                    5.heightBox,
                    AppStyles.normal(
                        title: "This is the service section of a doctor",
                        color: AppColors.textcolor.withOpacity(0.5),
                        size: AppSizes.size12
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomButton(
          buttonText: "Book an appointment",
          onTap: (){
            Get.to(()=> const BookAppointmentView());
          },
        ),
      ),
    );
  }
}
