import 'package:ecom/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
  void validation() {
    final FormState? _form = _formkey.currentState;
    if (_form!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 600,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35.0),
                        height: 400.0,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              validator: (String? value) {
                                if (value == "") {
                                  return "Email cannot be empty";
                                } else if (!regExp.hasMatch(value!)) {
                                  return "Invalid Email";
                                } else {
                                  return "";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              obscureText: obserText,
                              validator: (String? value) {
                                if (value == "") {
                                  return "Password cannot be empty";
                                } else if (value!.length < 5) {
                                  return "Password must be more than 5 letters";
                                } else {
                                  return "";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        obserText = !obserText;
                                      });
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: Icon(obserText == true
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    validation();
                                  },
                                  child: Text("Login")),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Don't have any account?",
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (e) => SignUp()));
                                  },
                                  child: Text(
                                    'Register',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
