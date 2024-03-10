// ignore_for_file: use_build_context_synchronously, annotate_overrides, overridden_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/product/constant/color_constant.dart';
import 'package:flutterturizm/product/enums/logregpass_enums/password_enum/password_enum.dart';
import 'package:flutterturizm/product/extension/view_extension.dart';
import 'package:flutterturizm/product/mixin/logregpass_mixin/password_mixin/password_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/password_model/password_model.dart';
import 'package:flutterturizm/product/utility/database/logregpass_db/password_db/password_db.dart';
import 'package:flutterturizm/product/widget/text_widget/label_medium_text.dart';

import '../../../../bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';

abstract class MainPasswordBase<T extends StatefulWidget> extends State<T>
    with AuthPasswordResetBlocMixin {
  // model service
  PasswordModelService passwordModelService = PasswordModelService();

  // view size
  double dynamicWidth(double value) => maxWidth * value;
  double dynamicHeight(double value) => maxHeight * value;

  late final maxWidth = ViewSizeModelExtension(context).mediaSize.width;
  late final maxHeight = ViewSizeModelExtension(context).mediaSize.height;

  // send mail
  Future<void> sendMail() async {
    if (passwordModelService.formPasswordKey.currentState!.validate()) {
      final QuerySnapshot<Map<String, dynamic>> userRefTable = await PasswordDB
          .USERS
          .userEmailRef(passwordModelService.emailController.text);
      if (userRefTable.docs.isNotEmpty) {
        BlocProvider.of<AuthPasswordCubit>(context)
            .sendResetEmail(passwordModelService.emailController.text);
      } else {
        final snackBar = SnackBar(
          backgroundColor: MainAppColorConstants.blueMainColor,
          content: LabelMediumWhiteText(
            text: PasswordViewStrings.emailErrorText.value,
            textAlign: TextAlign.left,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
