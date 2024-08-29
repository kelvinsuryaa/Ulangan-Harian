import 'package:flutter/material.dart';

void main() => runApp(KalkulatorApp());

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kalkulator(),
    );
  }
}

class Kalkulator extends StatefulWidget {
  @override
  _KalkulatorState createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "x") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, Color color, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: color,
            padding: EdgeInsets.all(20.0),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                output,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("C", Colors.grey, Colors.black),
                    buildButton("+/-", Colors.grey, Colors.black),
                    buildButton("%", Colors.grey, Colors.black),
                    buildButton("/", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", Colors.grey.shade800, Colors.white),
                    buildButton("8", Colors.grey.shade800, Colors.white),
                    buildButton("9", Colors.grey.shade800, Colors.white),
                    buildButton("x", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", Colors.grey.shade800, Colors.white),
                    buildButton("5", Colors.grey.shade800, Colors.white),
                    buildButton("6", Colors.grey.shade800, Colors.white),
                    buildButton("-", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", Colors.grey.shade800, Colors.white),
                    buildButton("2", Colors.grey.shade800, Colors.white),
                    buildButton("3", Colors.grey.shade800, Colors.white),
                    buildButton("+", Colors.orange, Colors.white),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0", Colors.grey.shade800, Colors.white)
                        .expanded(flex: 2),
                    buildButton(".", Colors.grey.shade800, Colors.white),
                    buildButton("=", Colors.orange, Colors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
}
