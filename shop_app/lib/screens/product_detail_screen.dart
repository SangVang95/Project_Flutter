import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/provider/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String router = "detail";

  @override
  Widget build(BuildContext context) {
    print("rebuil");
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final product = arguments["product"] as Product;

    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(product.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Center(),
    );
  }
}
