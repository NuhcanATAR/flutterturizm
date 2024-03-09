import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/splash/splash_view.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/initialize/app_start.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthSignInCubit>(
          create: (BuildContext context) => AuthSignInCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}
