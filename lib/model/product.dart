class Product {
  final String name, description, category, brand, imagePath;
  final int productId, stockQuantity;
  final double price;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.stockQuantity,
    required this.brand,
    required this.imagePath,
  });
}
