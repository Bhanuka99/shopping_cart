import 'package:app4/data/product_data.dart';
import 'package:app4/models/product_model.dart';
import 'package:app4/pages/cart_page.dart';
import 'package:app4/pages/favorite_page.dart';
import 'package:flutter/material.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = ProductData().products;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping",
          style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>const FavoritePage())
              );
            },
            backgroundColor: Colors.deepOrange,
            heroTag: "fav_button",
            child: const Icon(
                Icons.favorite,
                color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
          FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>const CartPage())
              );
            },
            backgroundColor: Colors.deepOrange,
            heroTag: "cart_button",
            child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          final Product product = products[index];
          return Card(
            child: ListTile(
              title: Row(
                children: [
                  Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ) ,
                  ),
                  const SizedBox(width: 50,),
                  const Text(
                      "0",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ) ,
                  ),
                ],
              ),
              subtitle: Text("\$${product.price.toString()}"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.favorite)
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.shopping_cart)
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
