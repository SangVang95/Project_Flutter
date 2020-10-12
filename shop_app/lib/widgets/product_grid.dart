import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/product_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductGird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    // final product = Provider.of<Product>(context);

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productProvider.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
            // Reuse object
            value: productProvider.items[index],
            child: ProductItem()));
  }
}
