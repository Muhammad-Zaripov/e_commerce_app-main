import 'package:flutter/material.dart';

class EmailTextFromFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextFromFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Iltimos emailni kiriting';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Emailni kiritng',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
