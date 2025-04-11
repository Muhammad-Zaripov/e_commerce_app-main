import 'package:e_commerce_app/service/user_server.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AppService appService = AppService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 185, 234),
      appBar: AppBar(title: Text("Log in")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  label: Text("email"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  label: Text("password"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                appService.addUsers(email: email.text, password: password.text);
                Navigator.pop(context);
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
