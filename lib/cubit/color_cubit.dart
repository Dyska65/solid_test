import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<BackgroundColor> {
  ColorCubit() : super(BackgroundColor(Colors.white));

  void generateColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    emit(BackgroundColor(Color.fromRGBO(red, green, blue, 1)));
  }

  void changeColor(Color color) {
    emit(BackgroundColor(color));
  }
}

class BackgroundColor {
  Color color;
  bool get isBright => color.red + color.blue + color.green > 382;
  BackgroundColor(this.color);
}
