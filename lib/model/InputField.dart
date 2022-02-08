import "package:flutter/material.dart";
import 'package:loop/widget/Widget.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller;
  final String hintText;
  final String text;

  InputField(this._controller, this.hintText, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.purple),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: textField(hintText: hintText, controller: _controller),
        )
      ],
    );
  }
}
