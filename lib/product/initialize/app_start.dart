import 'package:flutter/material.dart';
import 'package:flutterturizm/firebase_options.dart';

// pub dev
import 'package:intl/date_symbol_data_local.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';

@immutable
class AppStart {
  const AppStart._();

  static Future<void> initStartApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    initializeDateFormatting('tr_TR', null);
  }
}
