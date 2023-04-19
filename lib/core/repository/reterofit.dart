import 'package:dio/dio.dart';
import 'package:macro_global_task/core/models/product_details.dart';
import 'package:retrofit/http.dart';
part 'reterofit.g.dart';

@RestApi(
  baseUrl: "",
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('{url}')
  Future<ProductDetails> getProductDetails(
    @Path() String url,
  );
  @GET('{url}')
  Future<Products> getSingleProductDetails(
    @Path() String url
  );
}
