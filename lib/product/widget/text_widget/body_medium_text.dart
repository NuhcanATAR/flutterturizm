import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class BodyMediumBlackText extends StatelessWidget {
  const BodyMediumBlackText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}

class BodyMediumBlackBoldText extends StatelessWidget {
  const BodyMediumBlackBoldText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BodyMediumWhiteBoldText extends StatelessWidget {
  const BodyMediumWhiteBoldText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class BodyMediumWhiteText extends StatelessWidget {
  const BodyMediumWhiteText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}

class BodyMediumWhiteShadowText extends StatelessWidget {
  const BodyMediumWhiteShadowText(
      {required this.text, required this.textAlign, super.key});

  final String text;
  final dynamic textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.nunito(
        textStyle: context.general.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          shadows: [
            const BoxShadow(
              color: Colors.black,
              offset: Offset(1, 0),
              blurRadius: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
