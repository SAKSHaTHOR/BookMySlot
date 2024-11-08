
import '../../consts/consts.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bluecolor,
        title: AppStyles.bold(title: "Category Name",color:AppColors.whitecolor,size: AppSizes.size18 ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        mainAxisExtent: 170,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context,int index){
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.bgDarkColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    width: 150,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          color: AppColors.bluecolor,
                          child: Image.asset(
                            AppAssets.icLogin,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5), // Use SizedBox for spacing
                        AppStyles.normal(title: "Electrician Name"),
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
                  );
            },
        ),
      ),
    );
  }
}
