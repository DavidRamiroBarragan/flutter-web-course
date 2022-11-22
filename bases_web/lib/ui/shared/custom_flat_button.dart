import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onPress;
  final String label;
  final Color color;

  const CustomFlatButton(
      {Key? key,
      required this.onPress,
      required this.label,
      this.color= Colors.pink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(foregroundColor: color),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(label),
        ));
  }
}
