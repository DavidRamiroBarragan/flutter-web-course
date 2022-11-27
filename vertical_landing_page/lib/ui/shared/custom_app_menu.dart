import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController controller;
  final Duration _duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _isOpen ? controller.reverse() : controller.forward();
          setState(() {
            _isOpen = !_isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              AnimatedContainer(
                duration: _duration,
                curve: Curves.easeInOut,
                width: _isOpen ? 50 : 0,
              ),
              Text(
                "Menu",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              ),
              const Spacer(),
              AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.white,
                progress: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
