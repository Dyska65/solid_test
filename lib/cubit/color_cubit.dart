import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.white);

  void generateColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    emit(Color.fromRGBO(red, green, blue, 1));
  }
}
