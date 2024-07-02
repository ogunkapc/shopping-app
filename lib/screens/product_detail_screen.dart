import 'package:flutter/material.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/model/cart.dart';
import 'package:shopz/model/product.dart';
import 'package:shopz/screens/main_screen/pages/checkout_screen.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.lightGreyColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        elevation: 0,
        title: Text(
          product.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: ColorConstants.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.5,
              alignment: Alignment.topCenter,
              child: Hero(
                tag: "${product.productId}",
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.fill,
                  width: size.width,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.blackColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$${product.price.toString()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 17.5,
                        color: ColorConstants.black50,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(context),
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    final cart = CartProvider.of(context)!.cart;
    return BottomAppBar(
      // height: 70,
      color: ColorConstants.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(color: ColorConstants.primaryColor),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  addToCart(cart, context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorConstants.primaryColor,
                  ),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(
                      color: ColorConstants.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Cart cart, BuildContext context) {
    cart.addToCart(product);
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "${product.name} ",
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                ),
              ),
              TextSpan(
                text: "added to cart",
                style: TextStyle(
                  color: ColorConstants.blackColor,
                ),
              )
            ],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      backgroundColor: ColorConstants.whiteColor,
    );
  }
}
