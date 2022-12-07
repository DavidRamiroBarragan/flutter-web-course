import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Text('404 - Not page found', style: GoogleFonts.montserratAlternates(
          fontSize: 50,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
