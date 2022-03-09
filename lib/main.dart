// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Form App",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ),
        body: Forms(),
      ),
    );
  }
}

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final keys = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            maxLength: 15,
            decoration: InputDecoration(
              hintText: "Enter Username",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Phone number",
              icon: Icon(Icons.phone_android),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              if (value.length != 10) {
                return 'Please enter a valid phone number';
              }

              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'abcd@hotmail.com',
                icon: Icon(Icons.mail)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email address';
              }

              if (!RegExp(
                      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
                return 'Please enter a valid email Address';
              }

              return null;
            },
          ),
          TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password",
              labelText: "Password",
              icon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter the password';
              }
              if (value.length < 8) {
                return 'Password must atleast be 8 characters long';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            controller: confirmpassword,
            decoration: InputDecoration(
              hintText: "Re-enter the password",
              labelText: "Confirm Password",
              icon: Icon(Icons.lock),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please re-enter the password';
              }
              if (value.length < 8) {
                return 'Password must atleast be 8 characters long';
              }
              if (password.text != confirmpassword.text) {
                return "Password does not match";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: 50.0,
              width: 100.0,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  if (keys.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Result()));
                  }
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
