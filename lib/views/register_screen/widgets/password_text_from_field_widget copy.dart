import 'package:flutter/material.dart';

class PasswordTextFromFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextFromFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Iltimos parolni kiriting';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Parolni kiritng',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
