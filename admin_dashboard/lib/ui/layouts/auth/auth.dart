import 'package:admin_dashboard/ui/layouts/auth/widgets/background_app.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [_DesktopBody(child: child)],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          BackgroundApp(),
          Container(
            width: 600,
            color: Colors.black,
            height: double.infinity,
            child: Column(
              children: [
                const CustomTitle(),
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: child)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
