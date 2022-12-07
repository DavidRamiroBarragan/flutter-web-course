import 'package:admin_dashboard/providers/menu.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    MenuProvider.animationController = AnimationController(
        vsync: this, duration: const Duration(microseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const Sidebar(),
              Expanded(
                  child: Column(children: [
                const Navbar(),
                Expanded(child: widget.child)
              ]))
            ],
          ),
          if (size.width < 699)
            AnimatedBuilder(
                animation: MenuProvider.animationController,
                builder: (context, _) => Stack(children: [
                      if (MenuProvider.isOpen)
                        AnimatedOpacity(
                          opacity: MenuProvider.opacity.value,
                          duration: const Duration(milliseconds: 200),
                          child: GestureDetector(
                            onTap: () {
                              MenuProvider.close();
                            },
                            child: Container(
                              width: size.width,
                              height: size.height,
                              color: Colors.black12.withOpacity(0.4),
                            ),
                          ),
                        ),
                      Transform.translate(
                        offset: Offset(MenuProvider.movement.value, 0),
                        child: const Sidebar(),
                      )
                    ])),
        ],
      ),
    );
  }
}
