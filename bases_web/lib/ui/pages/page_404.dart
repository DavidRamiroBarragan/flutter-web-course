import 'package:flutter/material.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: const [
          Text(
            "Error 404",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
