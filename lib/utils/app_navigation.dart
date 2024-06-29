import 'package:flutter_mvc_getx/data/models/product_model.dart';
import 'package:flutter_mvc_getx/ui/home_scene/screens/home_page.dart';
import 'package:flutter_mvc_getx/ui/login_scene/screens/login_page.dart';
import 'package:flutter_mvc_getx/ui/product_scene/controllers/product_controller.dart';
import 'package:flutter_mvc_getx/ui/product_scene/screens/product_page.dart';
import 'package:flutter_mvc_getx/utils/app_routes.dart';
import 'package:get/get.dart';
// 

class AppNavigation {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.productDetails,
      page: () => ProductPage(),
      binding: BindingsBuilder(() {
        final product = Get.arguments as ProductElement;
        Get.put(ProductController(product));
      }),
    ),
  ];
}