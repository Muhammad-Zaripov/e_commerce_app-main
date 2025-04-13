import 'package:e_commerce_app/views/home_screen/screen/home_screen.dart';
import 'package:e_commerce_app/views/register_screen/widgets/email_text_from_field_widget.dart';
import 'package:flutter/material.dart';
import '../../login_screen/screen/login_screen.dart';
import '../../login_screen/widgets/password_text_from_field_widget copy.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text('Ro\'yxatdan o\'tish'),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 300),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              EmailTextFromFieldWidget(controller: _registerEmailController),
              PasswordTextFromFieldWidget(
                controller: _registerPasswordController,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Tizimga kirish',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
              ),
            ],
          ),
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
