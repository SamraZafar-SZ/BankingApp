import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.string,
    required this.keyboardtype,
    required this.obse,
  });
  final TextEditingController controller;
  final String string;
  final TextInputType keyboardtype;
  final bool obse;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        label: Text(
          string,
          style: const TextStyle(
            inherit: true,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      keyboardType: keyboardtype,
      obscureText: obse,
    );
  }
}
