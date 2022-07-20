import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:solid_test/cubit/color_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, color) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Color'),
            actions: [
              IconButton(
                onPressed: () {
                  _showDialog(color);
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          backgroundColor: color,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: context.read<ColorCubit>().generateColor,
            child: const Center(
              child: Text("Hey there"),
            ),
          ),
        );
      },
    );
  }

  void _showDialog(Color currentColor) {
    Color pickerColor = currentColor;
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color _color) {
                pickerColor = _color;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                context.read<ColorCubit>().changeColor(pickerColor);
                Navigator.pop(context);
              },
              child: const Text('Save!'),
            )
          ],
        );
      },
    );
  }
}
