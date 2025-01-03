import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/trustbox_app.dart';

void main() async{
  // ensure flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp();

  // run the app
  runApp(const TrustBoxApp());
}

