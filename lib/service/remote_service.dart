import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/product_model.dart';

class RemoteServices {
  static var client = http.Client();
  List<ProductModel> productList = <ProductModel>[].obs;
  Future<List<ProductModel>> fetchProducts() async {
    http.Response response = await client
        .get(Uri.https('mocki.io', '/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9'));
    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body.toString())['products'];
      jsonString.forEach((element) {
        Map obj = element;
        ProductModel product = ProductModel(thumbnail: obj['thumbnail']);
        productList.add(product);
      });
      return productList;
    } else {
      return productList;
    }
  }
}
