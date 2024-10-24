import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final double totalCost;

  CheckoutScreen({required this.totalCost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Amount: \$${totalCost.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle order confirmation here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Order Confirmed!'),
                    content: Text('Your order has been placed successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Confirm Order'),
            ),
          ],
        ),
      ),
    );
  }
}
