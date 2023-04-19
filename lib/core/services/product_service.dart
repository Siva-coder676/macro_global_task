import 'package:logger/logger.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:macro_global_task/core/repository/network.dart';

class ProductService {
  Future<ProductDetails?>? getProductDetails() async {
    try {
      ProductDetails productDetailsResponse =
          await MyApi().getClient()!.getProductDetails("/products");
      return productDetailsResponse;
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  Future<Products?>? getSingleProduct(int? productId) async {
    try {
      Products products = await MyApi()
          .getClient()!
          .getSingleProductDetails("/products/$productId");
      return products;
    } catch (e) {
      Logger().e(e.toString());
    }
  }
}
