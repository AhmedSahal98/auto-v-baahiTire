import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:baahiTire_app/model/shirkadahaModel.dart';
import 'package:flutter/material.dart';

abstract class ShirkadahaStates extends Equatable {}

class InitialState extends ShirkadahaStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends ShirkadahaStates {
  @override
  List<Object> get props => [];
}

class LoginState extends ShirkadahaStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends ShirkadahaStates {
  LoadedState({
    required this.shirkadaha,
    required this.shirkadahaSliders,
  });
  late List<ShirkadaModel> shirkadaha;
  late List<SlidersModel> shirkadahaSliders;

  @override
  List<Object?> get props => [shirkadaha, shirkadahaSliders];
}
class RefreshingState extends ShirkadahaStates {
  @override
  List<Object?> get props => [];
}

class DetailState extends ShirkadahaStates {
  DetailState(
    this.shirkada,
  );
  late ShirkadaModel shirkada;
  @override
  List<Object?> get props => [shirkada];
}

