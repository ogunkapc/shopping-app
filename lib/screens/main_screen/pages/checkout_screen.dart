import 'package:flutter/material.dart';
import 'package:shopz/screens/order_success_screen.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/model/cart.dart';
import 'package:shopz/model/product.dart';
import 'package:shopz/util/constants/image_constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final cartState = CartProvider.of(context);
    final cart = cartState!.cart;
    List<Product> userCart = cart.getUserCartItems();

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Your ShopZ Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userCart.length,
        itemBuilder: (context, index) {
          final product = userCart[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            leading: Image.asset(product.imagePath),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  cartState.removeFromCart(product);
                });
              },
              icon: Icon(
                Icons.delete,
                color: ColorConstants.primaryColor,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: userCart.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageConstants.emptyCart),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.blackColor,
                    ),
                  ),
                ],
              ),
            )
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderSuccessScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorConstants.primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: ColorConstants.whiteColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Checkout",
                          style: TextStyle(
                            color: ColorConstants.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
