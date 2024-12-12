import 'package:bt/consts/consts.dart';
import 'package:bt/consts/images.dart';
import 'package:bt/consts/strings.dart';
import 'package:bt/controllers/auth_controller.dart';
import 'package:bt/res/components/custom_button.dart';
import 'package:bt/res/components/custom_textfield.dart';
import 'package:bt/views/appointment_view/appointment_view.dart';
import 'package:bt/views/home_view/home_view.dart';
import 'package:bt/views/signup_view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_view/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

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
              AppAssets.icLogin,
              width: 300,
            ),
            10.heightBox,
            AppStyles.bold(title:AppStrings.welcomeBack,size: AppSizes.size18),
            AppStyles.bold(title:AppStrings.weAreExcited)

                          ],
                        ),
            20.heightBox,
            Expanded(
                child: Form(child: SingleChildScrollView(
                  child: Column(

                    children: [
                      CustomTextfield(hint: AppStrings.email,textController: controller.emailController,),
                      10.heightBox,
                      CustomTextfield(hint: AppStrings.password,textController: controller.passwordController,),
                      10.heightBox,
                      SwitchListTile(value: isElectrician, onChanged:(newValue){
                        setState(() {
                                isElectrician = newValue;
                        });
                      },
                      title: "Sign in as a Electrician".text.make(),),
                      20.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child:AppStyles.normal( title:AppStrings.forgetPassword),
                      ),
                      20.heightBox,
                       CustomButton(buttonText: AppStrings.login,
                         onTap: () async{
                         await controller.loginUser();
                         if(controller.userCredential!=null) {
                           if(isElectrician){
                             Get.to(()=> const AppointmentView());
                           }else {
                             Get.to(() => const Home());
                           }
                         }
                       },),
                      20.heightBox,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        AppStyles.normal(title: AppStrings.dontHaveAccount),
                          8.widthBox,
                        GestureDetector(
                          onTap: (){
                            Get.to(()=>SignupView());
                          },
                          child: AppStyles.bold(title: AppStrings.signup),
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
