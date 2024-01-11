import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skbazar/auth/login_Screen.dart';
import 'package:skbazar/round_button.dart';
import 'package:skbazar/utils/utils.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  bool loading = false;
  final _fornkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usercontroller = TextEditingController();
  final phonecontoller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    if (_fornkey!.currentState!.validate()) {
      _auth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: true,
        title: Center(child: Text("SignUp")),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _fornkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: "Email", prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Email";
                        } else if (!value.contains('@')) {
                          return "Please enter valid email";
                        } else if (!value.contains('gmail.com')) {
                          return "please enter an valid email";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password", prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (value.length < 6) {
                          return "password must be at least 6 chr";
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: usercontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Icon(Icons.verified_user)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: phonecontoller,
                      obscureText: false,
                      decoration: InputDecoration(
                      
                          hintText: "phone num",
                          prefixIcon: Icon(Icons.verified_user)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter user name';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Roundbutton(
                title: 'SignUP',
                loading: loading,
                onTap: () {
                  setState(() {
                    loading = true;
                  });
                  if (_fornkey!.currentState!.validate()) {
                    signup();
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
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("LogIn"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
