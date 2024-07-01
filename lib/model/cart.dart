import 'package:shopz/model/product.dart';

class Cart {
  // List for sale
  List<Product> productList = [
    Product(
      id: 1,
      name: "Office Code",
      price: 234,
      description: "Dummy Text for description of the product.",
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      id: 2,
      name: "Belt Bag",
      price: 234,
      description: "dummyText",
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      id: 3,
      name: "Hang Top",
      price: 234,
      description: "dummyText",
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      id: 4,
      name: "Old Fashion",
      price: 234,
      description: "dummyText",
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      id: 5,
      name: "Office Code",
      price: 234,
      description: "dummyText",
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      id: 6,
      name: "Office Code",
      price: 234,
      description: "dummyText",
      imagePath: "assets/images/congratulations.png",
    ),
  ];

  // list of products in the cart
  List<Product> userCart = [];

  // get list of products for sale
  List<Product> getProductsList() {
    return productList;
  }

  // get cart
  List<Product> getUserCart() {
    return userCart;
  }

  // Add to cart
  void addToCart(Product product) {
    userCart.add(product);
  }

  // Remove from cart
  void removeFromCart(Product product) {
    userCart.remove(product);
  }
}
