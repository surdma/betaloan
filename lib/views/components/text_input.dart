import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required TextEditingController controller,
    this.label,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 2.0,
        child: TextFormField(
          controller: _controller,
          maxLength: 10,
          autofocus: true,
          autovalidateMode: AutovalidateMode.always,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            counter: const Offstage(),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          ),
        ),
      ),
    );
  }
}
