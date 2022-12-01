import 'package:flutter/material.dart';

class MenuItemCustom extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPress;

  const MenuItemCustom(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isActive,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
