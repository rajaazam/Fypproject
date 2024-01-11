import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skbazar/auth/phone_login.dart';
import 'package:skbazar/auth/signup_Screen.dart';
import 'package:skbazar/round_button.dart';
import 'package:skbazar/screens/post_scree.dart';
import 'package:skbazar/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
          title: Text("Login"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.email_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          } else if (!value.contains('@')) {
                            return "please enter valid email";
                          } else if (!value.contains("gmail.com")) {
                            return "Enter valid email";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (value.length < 6) {
                            return "password must be at least 6 chr";
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Roundbutton(
                          title: 'Login',
                          loading: loading,
                          onTap: () {
                            if (_formkey!.currentState!.validate()) {
                              login();
                            }
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signupscreen()));
                              },
                              child: Text("SignUp"))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWithPhone()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: Center(
                            child: Text("LogIn with Phone"),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
