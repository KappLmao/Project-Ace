import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter110/MasterFile.dart';
import 'package:flutter110/dashboard.dart';
import 'package:flutter110/Profile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/Dashboard': (context) => const Dashboard(),
        '/MasterFile': (context) => const MasterFile(),
      },
      debugShowCheckedModeBanner: false,
      title: 'LOGIN PAGE FLUTTER',
      home: My(),
    );
  }
}

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 160, right: 160, top: 150, bottom: 100),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 13, 3, 71),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      txtS('SIGN IN'),
                      txtT('Sign in your account'),
                      sizeH(10),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: name,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      sizeH(10),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: password,
                            obscureText: !passwordVisible,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              labelStyle: const TextStyle(color: Colors.black),
                              hintStyle: const TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.4),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      sizeH(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: TextButton(
                                onPressed: () {},
                                child: txtSs(' REMEMBER ME'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: TextButton(
                                onPressed: () {},
                                child: txtSt('FORGOT PASSWORD?'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      sizeH(10),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.4)),
                        onPressed: () {
                          login();
                        },
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: txt('Ace', 'MONITORING'),
            ),
          ],
        ),
      ),
    );
  }

  Widget textField(TextEditingController control, String label, String hint) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: control,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white.withOpacity(0.4),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget txt(String textT, String textS) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textT,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 150,
          ),
        ),
        Text(
          textS,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 100,
          ),
        ),
      ],
    );
  }

  Widget txtS(String textT) {
    return Text(
      textT,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 70,
      ),
    );
  }

  Widget txtT(String textT) {
    return Text(
      textT,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  Widget txtSs(String textT) {
    return Text(
      textT,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
      ),
    );
  }

  Widget txtSt(String textT) {
    return Text(
      textT,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        decoration: TextDecoration.underline,
        decorationColor: Colors.white,
        decorationThickness: 02,
        color: Colors.white,
        fontSize: 10,
      ),
    );
  }

  Widget sizeH(double high) {
    return SizedBox(
      height: high,
    );
  }

  Widget sizeW(double wide) {
    return SizedBox(
      width: wide,
    );
  }

  void login() async {
    var uri = Uri.parse("http://localhost/ace/users.php");
    Map<String, dynamic> json = {
      "username": name.text,
      "password": password.text,
    };
    Map<String, dynamic> responseBody = {
      "operation": "login",
      "json": jsonEncode(json),
    };
    var response = await http.post(
      uri,
      body: responseBody,
    );
    if (response.statusCode == 200) {
      print(response.body);
      if (response.body != "0") {
        name.clear();
        password.clear();
        Get.to(Dashboard());
      } else {
        Get.snackbar(
          'Login Failed',
          'Please check your username and password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } else {
      print(response.body);
    }
  }
}
