import 'package:flutter/material.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/model/cart.dart';
import 'package:shopz/model/product.dart';
import 'package:shopz/screens/product_detail_screen.dart';
import 'package:shopz/util/widgets/categories.dart';
import 'package:shopz/util/widgets/item_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final Cart cart = Cart();
  late List<Product> productList;
  late List<Product> filteredProductList;

  @override
  void initState() {
    super.initState();
    productList = cart.getProductsList();
    filteredProductList = productList;
  }

  void filterProducts(String category) {
    setState(() {
      if (category == "All") {
        filteredProductList = productList;
      } else {
        filteredProductList = productList
            .where((product) => product.category == category)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Categories(onSelected: filterProducts),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: productList.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        itemCount: filteredProductList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.5,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return ItemCard(
                            product: filteredProductList[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    product: filteredProductList[index],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
