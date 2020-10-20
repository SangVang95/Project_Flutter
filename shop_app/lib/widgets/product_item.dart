import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final Product product;
  // ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    print("rebuild items");
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.router,
                arguments: {"product": product});
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: Consumer<Product>(
          builder: (context, product, child) => GridTileBar(
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                  product.isFavotite ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            trailing: IconButton(
                color: Theme.of(context).accentColor,
                icon: Icon(Icons.shopping_basket),
                onPressed: () {}),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
    );
  }
}
