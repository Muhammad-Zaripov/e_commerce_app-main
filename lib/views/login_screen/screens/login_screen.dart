import 'package:e_commerce_app/views/home_screen/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../register_screen/screens/register_screen.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text('Tizimga kirish'),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 300),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 30,
          children: [
            TextFieldWidget(hintText: 'Email kiriting'),
            TextFieldWidget(hintText: 'Parol kiriting'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                'Ro\'yxatdan o\'tish',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FilledButton(
        style: FilledButton.styleFrom(backgroundColor: Colors.grey.shade600),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: Text('Kirish', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
