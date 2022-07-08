import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}     // Создаётся абстрактный класс, объединяющий все события

// Дальше описываются все события в виде обычных классов, унаследованных от общего
class RedColorEvent extends ColorEvent {}
class GreenColorEvent extends ColorEvent {}

// Абстрактный класс Bloc в качестве дженерика принимает событие и состояние (ColorEvent и Color)
class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.red) {    // В конструктор класса передаём значение (состояние) по умолчанию
    // Для каждого обрабатываемого события вызываем метод on() и в качестве дженерика передаём ему тип каждого события
    on<RedColorEvent>((event, emit) => emit(Colors.red));         // Колбек принимает событие и эмит, который эмитит 
    on<GreenColorEvent>((event, emit) => emit(Colors.green));     // нужное значение/состояние для входного события
  }
}