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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedProduct.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$${loadedProduct.price}",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            loadedProduct.description,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
    );
  }
}
