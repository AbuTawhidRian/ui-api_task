import 'package:get/get.dart';
import 'package:task/model/product_model.dart';
import 'package:task/service/remote_service.dart';

class ProductController extends GetxController {
  List<ProductModel> productList = <ProductModel>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProductImage();
    super.onInit();
  }

  void fetchProductImage() async {
    isLoading(true);
    try {
      var product = await RemoteServices().fetchProducts();
      if (product != null) {
        productList = product as List<ProductModel>;
      }
    } finally {
      isLoading(false);
    }
  }
}
