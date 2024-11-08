import 'package:bt/consts/consts.dart';
import 'package:bt/consts/lists.dart';
import 'package:bt/res/components/custom_textfield.dart';
// import 'package:bt/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:bt/views/electrician_profile_view/electrician_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: AppStyles.bold(
          title: "${AppStrings.welcome} User",
          color: AppColors.whitecolor,
          size: AppSizes.size18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: AppColors.bluecolor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      hint: AppStrings.search,
                      borderColor: AppColors.whitecolor,
                      textColor: AppColors.whitecolor,
                    ),
                  ),
                  const SizedBox(width: 10), // Use SizedBox for spacing
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 20), // Use SizedBox for spacing
        
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.bluecolor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(
                        top: 22,
                        left: 8,
                        right: 8,
                        bottom: 12,
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      width: 90,
                      child: Column(
                        children: [
                          Image.asset(
                            iconsList[index],
                            height: 40,
                            width: 45,
                            color: AppColors.whitecolor,
                          ),
                          const SizedBox(height: 5), // Use SizedBox for spacing
                          AppStyles.normal(
                            title: iconsTitleList[index],
                            color: AppColors.whitecolor,
                            size: AppSizes.size14,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        
            const SizedBox(height: 20), // Use SizedBox for spacing
        
            Align(
              alignment: Alignment.centerLeft,
              child: AppStyles.bold(
                title: "  Popular Doctors",
                color: AppColors.bluecolor,
                size: AppSizes.size18,
              ),
            ),
        
            const SizedBox(height: 10), // Use SizedBox for spacing
        
            SizedBox(
              height: 200,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=> const ElectricianProfileView());
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: AppColors.bgDarkColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: const EdgeInsets.only(right: 8),
                      width: 150,
                      height: 100,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: AppColors.bluecolor,
                            child: Image.asset(
                              AppAssets.icLogin,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 5), // Use SizedBox for spacing
                          AppStyles.normal(title: "Electrician Name"),
                          AppStyles.normal(title: "category", color: Colors.black54),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        
            const SizedBox(height: 5), // Use SizedBox for spacing
        
            GestureDetector(
              onTap: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: AppStyles.normal(
                  title: "View All  ",
                  color: AppColors.bluecolor,
                ),
              ),
            ),
           20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.bluecolor,
                    borderRadius: BorderRadius.circular(12), // Added border radius for consistency
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(AppAssets.icRepair, width: 25, color: AppColors.whitecolor),
                      const SizedBox(height: 5), // Use SizedBox for spacing
                      AppStyles.normal(title: "Lab Test", color: AppColors.whitecolor),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
