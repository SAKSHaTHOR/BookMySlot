import 'dart:developer';

import 'package:bt/consts/consts.dart';
import 'package:bt/consts/lists.dart';
import 'package:bt/controllers/home_controller.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:bt/views/category_details_view/category_details_view.dart';
import 'package:bt/views/electrician_profile_view/electrician_profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../search_view/search_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: AppStyles.bold(
          title: "  ${AppStrings.welcome} :)",
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

                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      borderColor: AppColors.whitecolor,
                      textColor: AppColors.whitecolor,
                      inputColor: AppColors.whitecolor,
                    ),
                  ),
                  const SizedBox(width: 10), // Use SizedBox for spacing
                  IconButton(
                    onPressed: () {
                      Get.to(()=>  SearchView(
                        searchQuery: controller.searchQueryController.text,
                      ));
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
        
            40.heightBox, // Use SizedBox for spacing
        
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>CategoryDetailsView(catName:iconsTitleList[index]));
                    },
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
        
            40.heightBox, // Use SizedBox for spacing
        
            Align(
              alignment: Alignment.centerLeft,
              child: AppStyles.bold(
                title: "  Popular Electricians",
                color: AppColors.bluecolor,
                size: AppSizes.size18,
              ),
            ),
        
            const SizedBox(height: 10), // Use SizedBox for spacing

            FutureBuilder<QuerySnapshot>(
                future: controller.getElectricianList(),
                builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    var data = snapshot.data?.docs;
                   // log(data!.length.toString());
                    return SizedBox(
                      height: 200,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount:data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(()=>  ElectricianProfileView(doc: data[index]));
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
                                  AppStyles.normal(title: data![index]['ElecName']),
                                  AppStyles.normal(title: data[index]['ElecCategory'], color: Colors.black54),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  // return Container(
                  //   child: child,
                  // );
                },
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: List.generate(4, (index) {
            //     return Container(
            //       decoration: BoxDecoration(
            //         color: AppColors.bluecolor,
            //         borderRadius: BorderRadius.circular(12), // Added border radius for consistency
            //       ),
            //       padding: const EdgeInsets.all(12),
            //       child: Column(
            //         children: [
            //           Image.asset(AppAssets.icRepair, width: 25, color: AppColors.whitecolor),
            //           const SizedBox(height: 5), // Use SizedBox for spacing
            //           AppStyles.normal(title: "Lab Test", color: AppColors.whitecolor),
            //         ],
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}
