import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.text,
    required this.func,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  final String text;
  final VoidCallback func;
  Color? bgColor = Colors.white;
  Color? fgColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.25,
      child: OutlinedButton(
        onPressed: func,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(bgColor)),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: fgColor,
          ),
        ),
      ),
    );
  }
}
