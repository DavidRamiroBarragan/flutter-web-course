import 'package:admin_dashboard/ui/shared/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              Expanded(child: Container(child: child))
            ],
          )
        ],
      ),
    );
  }
}
