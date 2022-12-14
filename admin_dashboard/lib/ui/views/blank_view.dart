import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          "Blank view",
          style: CustomLabels.h1(),
        ),
        const SizedBox( height: 10,),

        WhiteCard(
            title: "Sales Statistics",
            child: const Text("Hola Mundo")
        )
      ],
    );
  }
}
