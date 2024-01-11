import 'package:flutter/material.dart';

class VerifyCode extends StatefulWidget {
  final verificationId;
  const VerifyCode({super.key, required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify code"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
