import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/logreg_enum/logreg_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class CenterBodyWidget extends StatelessWidget {
  const CenterBodyWidget({
    super.key,
    required this.maxWidth,
  });

  final dynamic maxWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: context.padding.low,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // title
            buildTitleWidget(context),
            // sub title
            buildSubTitleWidget(context),
          ],
        ),
      ),
    );
  }

  // title
  Widget buildTitleWidget(BuildContext context) => SizedBox(
        width: maxWidth,
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              LoginRegisterViewStrings.titleText.value,
              speed: const Duration(milliseconds: 100),
              textAlign: TextAlign.left,
              textStyle: GoogleFonts.nunito(
                textStyle: context.general.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const BoxShadow(
                      color: Colors.black,
                      offset: Offset(1, 0),
                      blurRadius: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  // sub title
  Widget buildSubTitleWidget(BuildContext context) => SizedBox(
        width: maxWidth,
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              LoginRegisterViewStrings.subTitleText.value,
              speed: const Duration(milliseconds: 50),
              textAlign: TextAlign.left,
              textStyle: GoogleFonts.nunito(
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
            ),
          ],
        ),
      );
}
