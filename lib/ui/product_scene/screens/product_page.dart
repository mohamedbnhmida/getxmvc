import 'package:flutter/material.dart';
import 'package:flutter_mvc_getx/data/models/product_model.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductElement;

    // Initialize the controller with the product
    final ProductController _productController = Get.put(ProductController(product));

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              product.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Price:'),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            ),
            // Add more ListTile widgets for other details as needed
          ],
        ),
      ),
    );
  }
}
