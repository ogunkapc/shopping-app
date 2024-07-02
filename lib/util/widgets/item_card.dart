import 'package:flutter/material.dart';
import 'package:shopz/util/constants/color_constants.dart';
import 'package:shopz/model/product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final void Function()? onTap;

  const ItemCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.lightGreyColor,
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(
          //   color: Colors.grey.withOpacity(0.5),
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.productId}",
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.blackColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // product price
                  Text(
                    "\$${product.price.toString()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
