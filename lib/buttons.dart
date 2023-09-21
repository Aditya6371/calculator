import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.text,
    required this.color,
    required this.callback,
  });
  final String text;
  final Color color;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color.withOpacity(0.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          callback(text);
        },
      ),
    );
  }
}
