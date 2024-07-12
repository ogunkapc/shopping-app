import 'package:flutter/material.dart';
import 'package:shopz/model/product.dart';
import 'package:shopz/util/constants/image_constants.dart';

// class CartProvider extends InheritedWidget {
//   final Cart cart;
//   const CartProvider({super.key, required this.cart, required this.child})
//       : super(child: child);

//   @override
//   final Widget child;

//   static CartProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CartProvider>();
//   }

//   @override
//   bool updateShouldNotify(CartProvider oldWidget) {
//     return cart != oldWidget.cart;
//   }
// }

class CartProvider extends StatefulWidget {
  final Widget child;

  const CartProvider({super.key, required this.child});

  static _CartProviderState? of(BuildContext context) {
    return context.findAncestorStateOfType<_CartProviderState>();
  }

  @override
  State<CartProvider> createState() => _CartProviderState();
}

class _CartProviderState extends State<CartProvider> {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  // add to cart and update state
  void addToCart(Product product) {
    setState(() {
      _cart.addToCart(product);
    });
  }

  // remove from cart and update state
  void removeFromCart(Product product) {
    setState(() {
      _cart.removeFromCart(product);
    });
  }

  // clear cart and update state
  void clearCart() {
    setState(() {
      _cart.clearCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartInherited(
      cartState: this,
      child: widget.child,
    );
  }
}

class CartInherited extends InheritedWidget {
  const CartInherited(
      {super.key, required super.child, required this.cartState});

  final _CartProviderState cartState;
  // final Widget child;

  // static CartInherited? of(BuildContext context) {
  //   return context.dependOnInheritedWidgetOfExactType<CartInherited>();
  // }

  @override
  bool updateShouldNotify(CartInherited oldWidget) {
    return oldWidget.cartState != cartState;
  }
}

class Cart {
  // List for sale
  List<Product> productList = [
    Product(
        productId: 1,
        name: "Casual white T-Shirt",
        description:
            "This 100% cotton t-shirt is perfect for everyday wear. It features a classic round neck and a comfortable fit, making it a staple in any man's wardrobe.",
        category: "T-shirt",
        price: 19.99,
        stockQuantity: 200,
        brand: "CasualWear",
        imagePath: ImageConstants.whiteShirt),
    Product(
      productId: 2,
      name: "Skinny Blue Jeans",
      description:
          "These skinny jeans offer a comfortable stretch fit that moves with you. The stylish design is perfect for both casual and semi-formal occasions.",
      category: "Women",
      price: 49.99,
      stockQuantity: 150,
      brand: "DenimPro",
      imagePath: ImageConstants.skinnyJeans,
    ),
    Product(
      productId: 3,
      name: "Navy Blue Hoodie",
      description:
          "Stay warm and cozy with this men's hoodie, featuring a front pocket and a hood. Made from high-quality fabric, it is ideal for cool weather.",
      category: "Hoodies & Sweaters",
      price: 39.99,
      stockQuantity: 100,
      brand: "UrbanStyle",
      imagePath: ImageConstants.blueHoodie,
    ),
    Product(
      productId: 4,
      name: "1950s Vintage Swing Dress",
      description:
          "This elegant evening dress features a beautiful floral print. Made from high-quality materials, it is perfect for special occasions and parties.",
      category: "Women",
      price: 69.99,
      stockQuantity: 80,
      brand: "Elegance",
      imagePath: ImageConstants.vintageDress,
    ),
    Product(
      productId: 5,
      name: "Waterproof Black Jacket",
      description:
          "This waterproof jacket is designed to keep you dry and comfortable. It features a zipper closure and multiple pockets for convenience.",
      category: "Jacket",
      price: 89.99,
      stockQuantity: 60,
      brand: "OutdoorGear",
      imagePath: ImageConstants.blackJacket,
    ),
    Product(
      productId: 6,
      name: "Ma Croix Mens Sweatshirt",
      description:
          "Men's Solid Brushed Fleece Sweatshirt is designed for everyday wear. Perfect for any activity, whether you are running errands or hanging out. Midweight and ultra soft and strong fleece made with an optimized cotton and polyester blend. Ideal for keeping warm out in the cold without a cumbersome heavy sweatshirt. Fabric blend ensures less pilling than your standard crewneck sweaters. Color: Gray. Gender: male. Age Group: adult.",
      category: "Hoodies & Sweaters",
      price: 29.99,
      stockQuantity: 120,
      brand: "ComfyKnits",
      imagePath: ImageConstants.greySweatShirt,
    ),
    Product(
      productId: 7,
      name: "Classic Straight-Fit Jeans",
      description:
          "These classic straight-fit jeans offer a modern look and a comfortable fit. They are durable and perfect for everyday wear.",
      category: "Men",
      price: 59.99,
      stockQuantity: 140,
      brand: "DenimPro",
      imagePath: ImageConstants.straightJeans,
    ),
    Product(
      productId: 8,
      name: "V-Neck Pleated Chiffon Blouse",
      description:
          "Soft Fabric: 100% Polyester. Soft and lightweight material, provides you a comfortable feminine touch and cooling feel Ruffle Front Design: Casual Loose style with Notch v neck, designer stylish pleats design with lantern long sleeve, which you can roll up to half sleeve or put it off, you can wear it daily or office wear Curved hem with slight pleats design can hide the hip perfectly, long sleeves can be rolled-up, match well with jeans, tight pants, casual pants, leggings and shorts, or you can pair it with black pants and high heels for office work Easy Pair: It goes well with everything, can be dressed up with dress pants or dressed down with skinny jeans and leggings.",
      category: "Women",
      price: 34.99,
      stockQuantity: 160,
      brand: "TrendyTops",
      imagePath: ImageConstants.chiffonBlouse,
    ),
    Product(
      productId: 9,
      name: "Tailored Black Suit",
      description:
          "This tailored suit is perfect for formal occasions. It features a modern fit and is made from high-quality materials for a sophisticated look.",
      category: "Men",
      price: 199.99,
      stockQuantity: 50,
      brand: "FormalAttire",
      imagePath: ImageConstants.tailoredBlackSuit,
    ),
  ];

  // list of products in the cart
  List<Product> userCartItems = [];

  // get list of products for sale
  List<Product> getProductsList() {
    return productList;
  }

  // get cart
  List<Product> getUserCartItems() {
    return userCartItems;
  }

  // Add to cart
  void addToCart(Product product) {
    userCartItems.add(product);
  }

  // Remove from cart
  void removeFromCart(Product product) {
    userCartItems.remove(product);
  }

  // clear cart
  void clearCart() {
    userCartItems.clear();
  }

  // Calculate total price of items in cart
  // double getTotalPrice() {
  //   return userCartItems.fold(0, (total, current) => total + current.price);
  // }

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < userCartItems.length; i++) {
      totalPrice += userCartItems[i].price;
    }

    return totalPrice.toStringAsFixed(2);
  }
}
