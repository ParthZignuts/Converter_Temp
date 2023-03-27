import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TempValueTextField extends StatelessWidget {
  const TempValueTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      controller: controller,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple)),
          labelText: 'Temperature',
          labelStyle:
          TextStyle(color: Colors.white, fontSize: 20),
          hintText: 'Enter Temperature'),
    );
  }
}
