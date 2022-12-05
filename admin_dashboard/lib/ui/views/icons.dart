import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        Text(
          "Icons view",
          style: CustomLabels.h1(),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
                title: "ac_unit_outlined",
                width: 170,
                child: const Center(
                  child: Icon(Icons.ac_unit_outlined),
                )),
            WhiteCard(
                title: "access_alarm_outlined",
                width: 170,
                child: const Center(
                  child: Icon(Icons.access_alarm_outlined),
                )),
            WhiteCard(
                title: "abc_outline",
                width: 170,
                child: const Center(
                  child: Icon(Icons.abc_outlined),
                )),
            WhiteCard(
                title: "account_circle_outlined",
                width: 170,
                child: const Center(
                  child: Icon(Icons.account_circle_outlined),
                )),
            WhiteCard(
                title: "access_alarm_outlined",
                width: 170,
                child: const Center(
                  child: Icon(Icons.access_alarm_outlined),
                )),
          ],
        )
      ],
    );
  }
}
