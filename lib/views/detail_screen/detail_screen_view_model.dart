import 'package:logger/logger.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:macro_global_task/core/services/locator.dart';
import 'package:macro_global_task/core/services/product_service.dart';
import 'package:stacked/stacked.dart';

class DetailScreenViewModel extends BaseViewModel {
  int? id;

  Products? result;

  bool ? isLoadingState=true;

  ProductService productService = locator<ProductService>();
  
  DetailScreenViewModel(int? productId) {
    id = productId;
    Future.delayed(Duration(seconds: 2), () {
      getSingleProductDetails();
    });
  }

  getSingleProductDetails() async {
    result = await productService.getSingleProduct(id);
    Logger().w(result!.toJson());
    isLoadingState=false;
    notifyListeners();
  }
}
