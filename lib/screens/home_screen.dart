import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          appBar: AppBar(title: const Text('Color')),
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
}
