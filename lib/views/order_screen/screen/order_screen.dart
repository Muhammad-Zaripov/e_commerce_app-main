import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.grey.shade500,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              tileColor: Colors.grey.shade600,
              title: Text(
                'Banan',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              trailing: Row(
                spacing: 40,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'x2',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Text(
                    '\$10',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade600),
        onPressed: () {},
        child: Text('Buyurtma berish', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
