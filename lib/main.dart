import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_bloc_8/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_bloc 8 test',
      home: BlocProvider(
        create: (context) => ColorBloc(),     // Так сюда передаём класс нашего bloc
        child: const MyHomePage(),            // Здесь — виджет, для которого он работает ниже по дереву
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);    // Методу of() в дженерике важно передать наш сласс bloc
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_bloc 8 test'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            width: 100,
            height: 100,
            color: currentColor,
            duration: const Duration(milliseconds: 900),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () { _bloc.add(RedColorEvent()); },
            backgroundColor: Colors.red,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () { _bloc.add(GreenColorEvent()); },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}