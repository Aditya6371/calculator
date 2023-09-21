import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';
  String history = '';

  void btnClick(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == 'AC') {
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
        history = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _output = '';
        history = "$_num1  $_operator";
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operator == '*') {
          _output = (_num1 * _num2).toString();
        }
        if (_operator == '/') {
          _output = (_num1 / _num2).toString();
        }
        history = "$_num1  $_operator  $_num2";
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == 'DEL') {
        if (_output.isNotEmpty) {
          _output = _output.substring(0, _output.length - 1);
        }
      } else {
        _output += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: mediaquery.size.height * 0.06,
        title: const Text(
          "Calculator",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Container(
          height: mediaquery.size.height,
          width: mediaquery.size.width,
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    history,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade500),
                  ),
                ),
              ),
              Container(
                //color: Colors.white54.withOpacity(0.1),
                height: mediaquery.size.height * 0.2,
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    _output,
                    style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "AC",
                    color: Colors.green,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "C",
                    color: Colors.teal,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "DEL",
                    color: Colors.orange,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "/",
                    color: Colors.orange,
                    callback: btnClick,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "7",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "8",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "9",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "*",
                    color: Colors.orange,
                    callback: btnClick,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "4",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "5",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "6",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "-",
                    color: Colors.orange,
                    callback: btnClick,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "1",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "2",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "3",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "+",
                    color: Colors.orange,
                    callback: btnClick,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Buttons(
                    text: "00",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "0",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: ".",
                    color: Colors.transparent,
                    callback: btnClick,
                  ),
                  Buttons(
                    text: "=",
                    color: Colors.deepOrange.shade900,
                    callback: btnClick,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


