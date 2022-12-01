import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.bubble_chart_outlined,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Admin",
            style: GoogleFonts.montserratAlternates(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: Colors.white70),
          )
        ],
      ),
    );
  }
}
