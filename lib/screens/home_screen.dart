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
    return BlocBuilder<ColorCubit, BackgroundColor>(
      builder: (context, color) {
        print(color.isBright);
        return Scaffold(
          appBar: AppBar(
            title: Text('Color'),
            actions: [
              IconButton(
                onPressed: () {
                  _showDialog(color.color);
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          backgroundColor: color.color,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: context.read<ColorCubit>().generateColor,
            child: Center(
              child: Text(
                "Hey there",
                style: TextStyle(
                    color: color.isBright ? Colors.black : Colors.white),
              ),
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
