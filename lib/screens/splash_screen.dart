import 'package:flutter/material.dart';
import 'package:skbazar/firebaseservices/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  splashservices splashscreen = splashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscreen.islogin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Skardu Bazar"),
      ),
    );
  }
}
