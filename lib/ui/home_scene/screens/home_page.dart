import 'package:flutter/material.dart';
import 'package:flutter_mvc_getx/ui/home_scene/controllers/home_controller.dart';
import 'package:flutter_mvc_getx/ui/home_scene/widgets/product_card.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Obx(() {
        if (_homeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (_homeController.errorMessage.isNotEmpty) {
          return Center(child: Text(_homeController.errorMessage.value));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            itemCount: _homeController.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: _homeController.products[index]);
            },
            padding: EdgeInsets.all(10.0),
          );
        }
      }),
    );
  }
}
