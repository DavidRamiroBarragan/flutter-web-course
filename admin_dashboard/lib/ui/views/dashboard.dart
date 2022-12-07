import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            "Dashboard view",
            style: CustomLabels.h1(),
          ),
          const SizedBox( height: 10,),

          WhiteCard(
            title: "Sales Statistics",
            child: const Text("Hola Mundo")
          )
        ],
      ),
    );
  }
}
