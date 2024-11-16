import 'package:bt/consts/consts.dart';
import 'package:bt/consts/lists.dart';
import 'package:bt/controllers/auth_controller.dart';
import 'package:bt/controllers/settings_controller.dart';
import 'package:bt/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        elevation: 0.0,
        title: AppStyles.bold(title:AppStrings.settings,color: AppColors.whitecolor,size: AppSizes.size18),
      ),
      body: Obx(()=>
      controller.isLoading.value ? Center(child: CircularProgressIndicator(),):
        Column(
            children: [
              ListTile(
                leading: CircleAvatar(child: Image.asset(AppAssets.icSignup)),
                title: AppStyles.bold(title: controller.username.value),
                subtitle: AppStyles.normal(title: controller.email.value),
              ),
              const Divider(),
              20.heightBox,
              ListView(
                shrinkWrap: true,
                children: List.generate(
                    settingsList.length,
                        (index)=> ListTile(
                          onTap: ()async{
                             if(index==2){
                               AuthController().signout();
                               Get.offAll(()=> const LoginView());
                             }
                          },
                          leading: Icon(
                              settingsListIcon[index],
                              color: AppColors.bluecolor,
                          ),
                         title: AppStyles.bold(
                           title: settingsList[index],
                         ),
                        )),
              ),
            ],
        ),
      ),
    );
  }
}
