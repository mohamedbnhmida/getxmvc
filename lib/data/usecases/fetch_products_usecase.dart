import '../repositories/product_repository.dart';
import '../models/product_model.dart';

class FetchProductsUseCase {
  final ProductRepository _productRepository = ProductRepository();

  Future<List<ProductElement>> call() async {
    return await _productRepository.fetchProducts();
  }
}
