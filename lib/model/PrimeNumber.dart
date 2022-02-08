import 'package:flutter/material.dart';

import 'InputField.dart';
import '../widget/Result.dart';

class Logic extends StatefulWidget {
  const Logic({Key? key}) : super(key: key);

  @override
  _LogicState createState() => _LogicState();
}

class _LogicState extends State<Logic> {
  final TextEditingController _primeNumberController = TextEditingController();

  String result = '';
  String errorString = '';

  @override
  Widget build(BuildContext context) {
    bool isControllerEmpty = _primeNumberController.text.isEmpty;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(_primeNumberController, 'PrimeNumber', 'Prime'),
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
              if (_primeNumberController.text.isEmpty) {
                setState(() {
                  errorString = "Please Input a number";
                });
              } else {
                if (int.tryParse(_primeNumberController.text) == null ||
                    int.parse(_primeNumberController.text) == 0) {
                  setState(() {
                    result = 'Please input a valid number';
                  });
                } else {
                  int i, n = 0, flag = 0;
                  int num = int.parse(_primeNumberController.text);

                  n = num ~/ 2;

                  for (i = 2; i <= n; i++) {
                    if (num % i == 0) {
                      setState(() {
                        result = '$num is not prime number';
                      });

                      flag = 1;
                      break;
                    }
                  }
                  if (flag == 0) {
                    setState(() {
                      result = '$num is prime number';
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
