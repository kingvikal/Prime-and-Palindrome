import 'package:flutter/material.dart';

Widget textField(
    {required String hintText, required TextEditingController controller}) {
  return TextField(
    keyboardType: TextInputType.number,
    controller: controller,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        borderSide:
            BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2.0),
      ),
    ),
  );
}
