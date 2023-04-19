import 'package:logger/logger.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:macro_global_task/core/services/locator.dart';
import 'package:macro_global_task/core/services/product_service.dart';
import 'package:macro_global_task/views/detail_screen/detail_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CategoryScreenViewModel extends BaseViewModel {
  ProductService productService = locator<ProductService>();
  NavigationService navigationService = locator<NavigationService>();

  bool? _isProductLoadingState = true;
  bool get isProductLoadingState => _isProductLoadingState!;

  List<Products>? _products = [];
  List<Products> get products => _products!;

  CategoryScreenViewModel() {
    Future.delayed(Duration(seconds: 2), () {
      getProductDetails();
    });
  }

  getProductDetails() async {
    try {
      ProductDetails? result = await productService.getProductDetails();
      Logger().v(result!.products!.first.toJson());
      for (var products in result.products!) {
        _products!.add(products);
      }

      _isProductLoadingState = false;
      notifyListeners();
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  navigateToDetailScreen(int? id) {
    navigationService.navigateWithTransition(
        DetailScreenView(
          id: id,
        ),
        transition: "fade");
  }
}
