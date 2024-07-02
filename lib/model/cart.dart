import 'package:shopz/model/product.dart';

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
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      productId: 2,
      name: "Skinny Blue Jeans",
      description:
          "These skinny jeans offer a comfortable stretch fit that moves with you. The stylish design is perfect for both casual and semi-formal occasions.",
      category: "Women",
      price: 49.99,
      stockQuantity: 150,
      brand: "DenimPro",
      imagePath: "assets/images/congratulations.png",
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
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      productId: 4,
      name: "Floral Evening Dress",
      description:
          "This elegant evening dress features a beautiful floral print. Made from high-quality materials, it is perfect for special occasions and parties.",
      category: "Women",
      price: 69.99,
      stockQuantity: 80,
      brand: "Elegance",
      imagePath: "assets/images/congratulations.png",
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
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      productId: 6,
      name: "Cozy Grey Sweater",
      description:
          "Made from soft, warm fabric, this cozy sweater is perfect for chilly days. Its stylish design makes it a great addition to any wardrobe.",
      category: "Hoodies & Sweaters",
      price: 29.99,
      stockQuantity: 120,
      brand: "ComfyKnits",
      imagePath: "assets/images/congratulations.png",
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
      imagePath: "assets/images/congratulations.png",
    ),
    Product(
      productId: 8,
      name: "Chiffon Blouse",
      description:
          "This chiffon blouse features a stylish design and is perfect for both work and casual outings. Its lightweight fabric ensures all-day comfort.",
      category: "Women",
      price: 34.99,
      stockQuantity: 160,
      brand: "TrendyTops",
      imagePath: "assets/images/congratulations.png",
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

  // Calculate total price of items in cart
  double getTotalPrice() {
    return userCart.fold(0, (total, current) => total + current.price);
  }
}
