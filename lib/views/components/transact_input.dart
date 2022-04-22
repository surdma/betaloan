import 'package:flutter/material.dart';

class TransactInput extends StatelessWidget {
  final controller;
  final editable;
  const TransactInput({
    Key? key,
    required this.label,
    this.controller,
    this.editable = true,
  }) : super(key: key);

  final label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: editable,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
