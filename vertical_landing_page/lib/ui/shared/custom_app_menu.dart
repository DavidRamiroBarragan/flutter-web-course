import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController controller;
  final Duration _duration = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration);
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
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
          height: _isOpen ? 320 : 70,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(
                  duration: _duration, isOpen: _isOpen, controller: controller),
              if (_isOpen) ...[
                CustomMenuItem(text: "Home", onPress: () => pageProvider.goTo(0)),
                CustomMenuItem(text: "About", onPress: () => pageProvider.goTo(1)),
                CustomMenuItem(text: "Pricing", onPress: () => pageProvider.goTo(2)),
                CustomMenuItem(text: "Contact", onPress: () => pageProvider.goTo(3)),
                CustomMenuItem(text: "Location", onPress: () => pageProvider.goTo(4)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required Duration duration,
    required bool isOpen,
    required this.controller,
  })  : _duration = duration,
        _isOpen = isOpen,
        super(key: key);

  final Duration _duration;
  final bool _isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Center(
        child: Row(
          children: [
            AnimatedContainer(
              duration: _duration,
              curve: Curves.easeInOut,
              width: _isOpen ? 45 : 0,
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
    );
  }
}
