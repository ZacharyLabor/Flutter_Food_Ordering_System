class FoodItem {
  final String name;
  final double price;
  int quantity;

  FoodItem({
    required this.name,
    required this.price,
    this.quantity = 0,
  });
}
