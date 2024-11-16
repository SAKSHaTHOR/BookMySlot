import 'package:bt/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../electrician_profile_view/electrician_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key,required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
         backgroundColor: Colors.blue,
         elevation: 0.0,
         title: AppStyles.bold(
           title: " Search Results ",
           color: AppColors.whitecolor,
           size: AppSizes.size18,
         ),
       ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('Electricians').get(),
       // future: FirebaseFirestore.instance .collection('Electricians').where('ElecCategory', isEqualTo: catName).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // var data= snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {

                  var Elec = snapshot.data!.docs[index];

                  return !(Elec['ElecName'].toString().toLowerCase()).contains(searchQuery)
                    ? const SizedBox.shrink() :

                  GestureDetector(
                     onTap: (){
                       Get.to(()=>  ElectricianProfileView(doc: Elec));
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
                          AppStyles.normal(title: Elec['ElecName']),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: double.parse(Elec['ElecRating'].toString()),
                            stepInt: true,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
