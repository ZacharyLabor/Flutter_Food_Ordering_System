import 'package:flutter/material.dart';
import 'models/food_item.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  final List<FoodItem> cartItems;

  CartScreen({required this.cartItems});

  double getTotalCost() {
    return cartItems.fold(
      0.0,
      (previousValue, element) => previousValue + element.price * element.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('\$${(item.price * item.quantity).toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: \$${getTotalCost().toStringAsFixed(2)}'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen(totalCost: getTotalCost())),
              );
            },
            child: Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
