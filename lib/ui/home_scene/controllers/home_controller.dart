import 'package:flutter_mvc_getx/data/models/product_model.dart';
import 'package:flutter_mvc_getx/data/usecases/fetch_products_usecase.dart';
import 'package:get/get.dart'; 

class HomeController extends GetxController {
  final FetchProductsUseCase _fetchProductsUseCase = FetchProductsUseCase();
  var products = <ProductElement>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      products.value = await _fetchProductsUseCase();
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
