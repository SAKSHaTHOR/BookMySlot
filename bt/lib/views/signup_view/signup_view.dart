import 'package:bt/consts/consts.dart';
import 'package:bt/consts/images.dart';
import 'package:bt/consts/strings.dart';
import 'package:bt/controllers/auth_controller.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_view/home.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
var isElectrician = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top:50),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(
                  width: 400,
                  AppAssets.icSignup,
                ),
                10.heightBox,
                AppStyles.bold(title:AppStrings.signupNow,size: AppSizes.size18,alignment: TextAlign.center),
                // AppStrings.welcomeBack.text.make(),
                // AppStrings.weAreExcited.text.make(),
              ],
            ),
            20.heightBox,
            Expanded(
                child: Form(child: SingleChildScrollView(
                  child: Column(

                    children: [
                      CustomTextfield(hint: AppStrings.fullname,textController: controller.fullnameController,),
                      10.heightBox,
                      CustomTextfield(hint: AppStrings.email,textController: controller.emailController,),
                      10.heightBox,
                      CustomTextfield(hint: AppStrings.password,textController: controller.passwordController,),
                      10.heightBox,

                      SwitchListTile(title:"Sign up as a Electrician".text.make(),value: isElectrician, onChanged: (newValue){
                            setState(() {
                              isElectrician = newValue;
                            });
                      },),
                      Visibility(
                        visible: isElectrician,
                        child: Column(
                          children: [
                            CustomTextfield(hint: "About",textController: controller.aboutController,),
                            10.heightBox,
                            CustomTextfield(hint: "Category",textController: controller.categoryController,),
                            10.heightBox,
                            CustomTextfield(hint: "Services",textController: controller.servicesController,),
                            10.heightBox,
                            CustomTextfield(hint: "Address",textController: controller.addressController,),
                            10.heightBox,
                            CustomTextfield(hint: "Phone Number",textController: controller.phoneController,),
                            10.heightBox,
                            CustomTextfield(hint: "Timing",textController: controller.timingController,),
                            10.heightBox,
                          ],
                        ),
                      ),
                      20.heightBox,
                      CustomButton(buttonText: AppStrings.signup, onTap: () async{
                           await controller.signupUser(isElectrician);
                           if(controller.userCredential != null){
                             Get.offAll(()=> const Home());
                           }
                      },),
                      20.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppStyles.normal(title: AppStrings.alreadyHaveAccount),
                          8.widthBox,
                          GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: AppStyles.bold(title: AppStrings.login),
                          ),

                        ],
                      )
                    ],
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
