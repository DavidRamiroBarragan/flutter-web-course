import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';

class MaiinLayout extends StatelessWidget {
  final child;
  const MaiinLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const CustomMenuApp(),
            const Spacer(),
            Expanded(flex: 2, child: child),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
