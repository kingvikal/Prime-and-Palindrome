import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.isControllerEmpty,
    required this.errorString,
    required this.result,
  }) : super(key: key);

  final bool isControllerEmpty;
  final String errorString;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: isControllerEmpty ? null : Colors.teal,
        borderRadius: isControllerEmpty
            ? null
            : BorderRadius.circular(
                5,
              ),
      ),
      child: Center(
        child: Text(
          isControllerEmpty ? errorString : result,
          style:
              TextStyle(color: isControllerEmpty ? Colors.red : Colors.black),
        ),
      ),
    );
  }
}
