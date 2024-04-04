import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/firebase_options.dart';

import 'package:intl/date_symbol_data_local.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> initStartApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initializeDateFormatting('tr_TR', null);
  }
}
