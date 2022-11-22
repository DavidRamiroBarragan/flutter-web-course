import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomMenuApp extends StatelessWidget {
  const CustomMenuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      color: Colors.red,
      child: Row(
        children: [
          CustomFlatButton(
              onPress: () => Navigator.pushNamed(context, '/stateful'),
              label: 'Contador StateFul',
              color: Colors.black),
          const SizedBox(
            width: 10,
          ),
          CustomFlatButton(
              onPress: () => Navigator.pushNamed(context, '/provider'),
              label: 'Contador con Provider',
              color: Colors.black),
          CustomFlatButton(
              onPress: () => Navigator.pushNamed(context, '/otra'),
              label: 'Otra Página',
              color: Colors.black)
        ],
      ),
    );
  }
}
