import 'package:flutter/material.dart';
import 'package:shop_app/model/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String router = "detail";

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final product = arguments["product"] as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(),
    );
  }
}
