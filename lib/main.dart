import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterturizm/feature/splash/splash_view.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/login_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/password_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/logregpass_bloc/register_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/livesupport_bloc/cubit/livesupport_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/profile_bloc/cubit/cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/salepoints_bloc/cubit/salepoints_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/ticketdates_bloc/cubit/ticketdates_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/myticket_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticket_cubit.dart';
import 'package:flutterturizm/product/bloc/mainview_bloc/tickets_bloc/cubit/ticketcreate_cubit.dart';
import 'package:flutterturizm/product/initialize/app_start.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthSignInCubit>(
          create: (BuildContext context) => AuthSignInCubit(),
        ),
        BlocProvider<AuthSignInUpCubit>(
          create: (BuildContext context) => AuthSignInUpCubit(),
        ),
        BlocProvider<AuthPasswordCubit>(
          create: (BuildContext context) => AuthPasswordCubit(),
        ),
        BlocProvider<TicketsCubit>(
          create: (BuildContext context) => TicketsCubit(),
        ),
        BlocProvider<TicketDatesCubit>(
          create: (BuildContext context) => TicketDatesCubit(),
        ),
        BlocProvider<TicketCreateCubit>(
          create: (BuildContext context) => TicketCreateCubit(),
        ),
        BlocProvider<SalePointsCubit>(
          create: (BuildContext ontext) => SalePointsCubit(),
        ),
        BlocProvider<LiveSupportCubit>(
          create: (BuildContext context) => LiveSupportCubit(),
        ),
        BlocProvider<ProfileCubit>(
          create: (BuildContext context) => ProfileCubit(),
        ),
        BlocProvider<MyTicketsCubit>(
          create: (BuildContext context) => MyTicketsCubit(),
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
