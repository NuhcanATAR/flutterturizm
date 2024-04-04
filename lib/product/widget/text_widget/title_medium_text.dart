import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TitleMediumWhiteText extends StatelessWidget {
  const TitleMediumWhiteText({
    required this.text,
    required this.textAlign,
    super.key,
  });

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.headlineMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
