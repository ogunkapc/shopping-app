import 'package:flutter/material.dart';
import 'package:shopz/model/cart.dart';
import 'package:shopz/screens/main_screen/main_screen.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/util/constants/image_constants.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final cartState = CartProvider.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImageConstants.congratulations),
            const SizedBox(height: 20),
            Text(
              'Your order has been placed and is on its way!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ColorConstants.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  cartState!.clearCart();
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: ColorConstants.primaryColor,
                ),
                child: Text(
                  "Okay",
                  style: TextStyle(
                    color: ColorConstants.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
