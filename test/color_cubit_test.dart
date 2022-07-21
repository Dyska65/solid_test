import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solid_test/cubit/color_cubit.dart';

void main() {
  late ColorCubit colorCubit;

  setUp(() {
    colorCubit = ColorCubit();
  });

  tearDown(() {
    colorCubit.close();
  });

  test('Cubit should have like first color is white', () {
    expect(colorCubit.state, Colors.white);
  });

  blocTest<ColorCubit, Color>(
    'Function generateColor() have to emits type Color',
    setUp: () {},
    build: () => colorCubit,
    act: (colorCubit) => colorCubit.generateColor(),
    expect: () => const TypeMatcher<List<Color>>(),
  );
}
