import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:baahiTire_app/application/navigationBar.dart';
import 'package:baahiTire_app/application/screens/authentication/loginScreen.dart';
import 'package:baahiTire_app/application/screens/homeScreen.dart';
import 'package:baahiTire_app/application/screens/splash_screen.dart';
import 'package:baahiTire_app/cubit/shirkadaahaState.dart';
import 'package:baahiTire_app/cubit/shirkadahaCubits.dart';
import 'package:baahiTire_app/application/screens/detailScreen.dart';

class App_cubit_logics extends StatefulWidget {
  const App_cubit_logics({super.key});

  @override
  State<App_cubit_logics> createState() => _App_cubit_logicsState();
}

class _App_cubit_logicsState extends State<App_cubit_logics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShirkadahaCubits, ShirkadahaStates>(
          builder: (context, state) {
        if (state is DetailState) {
          return DetailScreen();
        }
        if (state is LoadedState) {
          return CustomNavigationBar();
        }
        if (state is LoginState || state is RefreshingState) {
          return Splash_screen();
        }
        if (state is LoadingState) {
          return Splash_screen();
        } else {
          return Container();
        }
      }),
    );
  }
}
