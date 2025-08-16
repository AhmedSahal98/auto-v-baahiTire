import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baahiTire_app/cubit/shirkadaahaState.dart';
import 'package:baahiTire_app/domain/repositories/shirkada_rep.dart';
import 'package:baahiTire_app/model/shirkadahaModel.dart';

class ShirkadahaCubits extends Cubit<ShirkadahaStates> {
  ShirkadahaCubits({required this.data}) : super(InitialState()) {
    emit(LoginState());
  }
  final ShirkadahaRep data;
  late var shirkadaha;
  late var shirkadahaSlider;
  Future<void> getData({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        emit(RefreshingState());
      } else {
        emit(LoadingState());
      }

      final stopwatch = Stopwatch()..start();

      stopwatch.stop();

      shirkadaha = await data.getData();
      shirkadahaSlider = await data.getSliders();

      emit(LoadedState(
        shirkadaha: shirkadaha,
        shirkadahaSliders: shirkadahaSlider,
      ));
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  detailPage(ShirkadaModel data) {
    emit(DetailState(
      data,
    ));
  }

  goHome() {
    emit(LoadedState(
      shirkadaha: shirkadaha,
      shirkadahaSliders: shirkadahaSlider,
    ));
  }
}
