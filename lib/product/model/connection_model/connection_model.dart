import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/feature/main/connection/connectionerror_view.dart';
import 'package:logger/logger.dart';

class ConnectionControlModel {
  Future<void> checkConnection(BuildContext context) async {
    final bool isConnected = await DataConnectionChecker().hasConnection;
    if (isConnected) {
      Logger().i('Bağlandı');
    } else {
      if (!context.mounted) return;
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ConnectionErrorView()),
      );
    }
  }
}
