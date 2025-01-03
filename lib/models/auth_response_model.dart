import 'package:firebase_auth/firebase_auth.dart';

class AuthResponseModel {
  final User? user;
  final String message;

  AuthResponseModel({this.user, required this.message});

  factory AuthResponseModel.fromException(dynamic e) {
    return AuthResponseModel(message: e.toString());
  }
}
