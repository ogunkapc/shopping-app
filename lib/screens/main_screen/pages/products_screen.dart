import 'package:flutter/material.dart';
import 'package:shopz/model/cart.dart';
import 'package:shopz/widgets/item_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Shopz'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Products'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: Cart().getProductsList().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return ItemCard(product: Cart().productList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
