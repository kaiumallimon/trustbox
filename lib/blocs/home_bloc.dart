import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class GetHomeData extends HomeEvent {}



@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String data;

  HomeLoaded(this.data);
}