import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skbazar/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDm5Gja-C3nAZL5QY1e7QfCtf9IDfwXpv0',
      projectId: '1:236491786666:android:d5c14427f5f179400703d3',
      messagingSenderId: '236491786666',
      appId: 'skardubazar-abfd1',
    ),
  );
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}
