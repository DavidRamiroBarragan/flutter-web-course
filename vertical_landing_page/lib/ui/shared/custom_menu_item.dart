import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPress;

  const CustomMenuItem({Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 150),
      child: MouseRegion(
          onExit: (_) {
            setState(() {
              isHover = false;
            });
          },
          onEnter: (_) {
            setState(() {
              isHover = true;
            });
          },
          child: GestureDetector(
            onTap: () => widget.onPress(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 150,
              height: 50,
              color: isHover ? Colors.pinkAccent : Colors.black,
              child: Center(
                child: Text(
                  widget.text,
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          )),
    );
  }
}
