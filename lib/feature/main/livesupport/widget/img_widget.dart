import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/constant/image_constant.dart';

class ImgWidget extends StatelessWidget {
  const ImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalMedium,
      child: AppLiveSupportImgConstants.startMessageImg.toImg,
    );
  }
}
