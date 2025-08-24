import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:degdeg_app/api/firebase_api.dart';
import 'package:degdeg_app/application/screens/authentication/loginScreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:degdeg_app/cubit/app_cubit_logics.dart';
import 'package:degdeg_app/cubit/shirkadahaCubits.dart';
import 'package:degdeg_app/domain/repositories/shirkada_rep.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'degdeg_app',
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        debugShowCheckedModeBanner: false,
        home: BlocProvider<ShirkadahaCubits>(
          create: (context) => ShirkadahaCubits(data: ShirkadahaRep()),
          child: App_cubit_logics(),
        ));
  }
}
