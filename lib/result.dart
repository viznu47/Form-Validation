// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Congratulations!',
              style: TextStyle(color: Colors.amber, fontSize: 25),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('assets/tick.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Yay! Data has been successfully validated',
                style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.amber,
                    backgroundColor: Colors.black),
              ),
            )
          ],
        ));
  }
}
