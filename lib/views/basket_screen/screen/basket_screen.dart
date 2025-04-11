import 'package:flutter/material.dart';

import '../../order_screen/screen/order_screen.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(backgroundColor: Colors.grey.shade500),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, indext) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              tileColor: Colors.grey.shade600,
              title: Text(
                'Banan',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              trailing: Text(
                'x2',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade600),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderScreen()),
          );
        },
        child: Text('Buyurtma berish', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
