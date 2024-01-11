import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skbazar/auth/verify_code.dart';
import 'package:skbazar/round_button.dart';
import 'package:skbazar/utils/utils.dart';


class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

bool loading = false;
final phonecontroller = TextEditingController();
final auth = FirebaseAuth.instance;

class _LoginWithPhoneState extends State<LoginWithPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phonecontroller,
              decoration: InputDecoration(hintText: "+92 1234 1234 123"),
            ),
            SizedBox(
              height: 80,
            ),
            Roundbutton(
                title: "Login",
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  auth.verifyPhoneNumber(
                      verificationCompleted: (_) {
                        setState(() {
                          loading = false;
                        });
                      },
                      phoneNumber: phonecontroller.text,
                      verificationFailed: (e) {
                        setState(() {
                          loading = false;
                        });
                        utils().toastMessage(e.toString());
                      },
                      codeSent: (String verificationId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCode(
                                      verificationId: verificationId,
                                    )));
                        setState(() {
                          loading = false;
                        });
                      },
                      codeAutoRetrievalTimeout: (e) {
                        utils().toastMessage(e.toString());
                        setState(() {
                          loading = false;
                        });
                      });
                })
          ],
        ),
      ),
    );
  }
}
