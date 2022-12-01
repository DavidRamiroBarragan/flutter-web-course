import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemCustom extends StatefulWidget {
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
  State<MenuItemCustom> createState() => _MenuItemCustomState();
}

class _MenuItemCustomState extends State<MenuItemCustom> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      color: isHover
          ? Colors.white.withOpacity(0.1)
          : widget.isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPress(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isHover = true;
                  });
                },
                onExit: (event) {
                  setState(
                    () {
                      isHover = false;
                    },
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.text,
                      style: GoogleFonts.roboto(
                          fontSize: 16, color: Colors.white.withOpacity(0.8)),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
