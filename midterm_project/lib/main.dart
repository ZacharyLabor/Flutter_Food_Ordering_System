import 'package:flutter/material.dart';
import 'models/food_item.dart';
import 'cart_screen.dart';

void main() {
  runApp(FoodOrderingApp());
}

class FoodOrderingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering System',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<FoodItem> menuItems = [
    FoodItem(name: 'Burger', price: 5.99),
    FoodItem(name: 'Pizza', price: 8.99),
    FoodItem(name: 'Pasta', price: 7.99),
    FoodItem(name: 'Fries', price: 2.99),
    FoodItem(name: 'Salad', price: 4.99),
  ];

  List<FoodItem> cartItems = [];

  void addToCart(FoodItem item) {
    setState(() {
      item.quantity += 1;
      if (!cartItems.contains(item)) {
        cartItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartItems),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () => addToCart(item),
              child: Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}
