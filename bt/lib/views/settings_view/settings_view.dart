import 'package:bt/consts/consts.dart';
import 'package:bt/consts/lists.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        elevation: 0.0,
        title: AppStyles.bold(title:AppStrings.settings,color: AppColors.whitecolor,size: AppSizes.size18),
      ),
      body: Column(
          children: [
            ListTile(
              leading: CircleAvatar(child: Image.asset(AppAssets.icSignup)),
              title: AppStyles.bold(title: "Username"),
              subtitle: AppStyles.normal(title: "user_email@gmail.com"),
            ),
            const Divider(),
            20.heightBox,
            ListView(
              shrinkWrap: true,
              children: List.generate(
                  settingsList.length,
                      (index)=> ListTile(
                        onTap: (){},
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
    );
  }
}
