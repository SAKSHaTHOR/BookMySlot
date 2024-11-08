import 'package:bt/consts/lists.dart';
import 'package:bt/views/category_details_view/category_details_view.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation:0.0 ,
          backgroundColor: Colors.blue,
          title: AppStyles.bold(title: AppStrings.category,size: AppSizes.size18,color: AppColors.whitecolor),
      ),
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200,
              ),
              itemCount: iconsList.length,
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: (){
                    Get.to(()=>const CategoryDetailsView());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.bgDarkColor,
                    ),


                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(iconsList[index],
                              width: 60,
                            color: AppColors.bluecolor,
                          ),
                        ),

                        30.heightBox,
                        AppStyles.bold(title: iconsTitleList[index],
                          color: AppColors.textcolor,
                          size: AppSizes.size16,
                        ),
                        10.heightBox,
                        AppStyles.normal(
                          title: "13 Specialists",
                          color: AppColors.textcolor.withOpacity(0.5),
                          size: AppSizes.size12,
                        ),
                      ],
                    ),
                  ),
                );
              },
          ),
        ),

          


    );
  }
}
