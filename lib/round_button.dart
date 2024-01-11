import 'package:flutter/material.dart';

class Roundbutton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onTap;
  const Roundbutton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading=false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child:loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.white,): Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
