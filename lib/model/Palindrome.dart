import 'package:flutter/material.dart';
import '../widget/Result.dart';

import 'InputField.dart';

class Palindrome extends StatefulWidget {
  const Palindrome({Key? key}) : super(key: key);

  @override
  _PalindromeState createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  final TextEditingController _palindromeController = TextEditingController();

  String result = '';
  String errorString = '';

  @override
  Widget build(BuildContext context) {
    bool isControllerEmpty = _palindromeController.text.isEmpty;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
                _palindromeController, 'Palindrome Number', 'Palindrome'),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 80, right: 80),
          child: ElevatedButton(
            onPressed: () {
              if (_palindromeController.text.isEmpty) {
                setState(() {
                  errorString = 'Please input a number.';
                });
              } else {
                if (int.tryParse(_palindromeController.text) == null ||
                    int.parse(_palindromeController.text) == 0) {
                  setState(() {
                    result = 'Please input a valid number';
                  });
                } else {
                  int reminder, reversed = 0, original;
                  int number = int.parse(_palindromeController.text);

                  original = number;
                  while (number != 0) {
                    reminder = number % 10;
                    reversed = (reversed * 10) + reminder;
                    number = number ~/ 10;
                  }
                  if (reversed == original) {
                    setState(() {
                      result = 'Its a palindrome.';
                    });
                  } else {
                    setState(() {
                      result = 'Its not a palindrome.';
                    });
                  }
                }
              }
            },
            child: const Text("Check"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Result(
            isControllerEmpty: isControllerEmpty,
            errorString: errorString,
            result: result),
      ],
    );
  }
}
