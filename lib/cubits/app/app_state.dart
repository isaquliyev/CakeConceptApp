import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppInProgress extends AppState {}

class AppSelectCountry extends AppState {}

class AppAuthenticated extends AppState {}

class AppLogin extends AppState {}

class AppFirstTimeOpened extends AppState {}

class AppOpenNotification extends AppState {}