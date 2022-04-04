import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/controller/product_controller.dart';
import 'package:get/get.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Color(0xffF4F5F7),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: .001,
                        ),
                      ],
                    ),
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Color(0xff040415),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: Color(0xff040415),
                        ),
                        hintText: 'Search in Swipexyz..',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () {
                      if (productController.isLoading.value == true) {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.deepOrange,
                        ));
                      } else {
                        return StaggeredGridView.countBuilder(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            itemCount: productController.productList.length,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showDialogFunc(
                                    context,
                                    '${productController.productList[index].thumbnail}',
                                  );
                                },
                                child: Image.network(
                                    '${productController.productList[index].thumbnail}'),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialogFunc(context, String image) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      image,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
