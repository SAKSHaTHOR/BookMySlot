import 'package:bt/consts/consts.dart';
import 'package:bt/consts/images.dart';
import 'package:bt/consts/strings.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      CustomTextfield(hint: AppStrings.fullname),
                      10.heightBox,
                      CustomTextfield(hint: AppStrings.email),
                      10.heightBox,
                      CustomTextfield(hint: AppStrings.password),
                      20.heightBox,
                      CustomButton(buttonText: AppStrings.signup, onTap: () {},),
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
