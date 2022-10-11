import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      return Navigator.pushReplacementNamed(context, 'main');
    });
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset('assets/image/logo.png')),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '24/7 News',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'News on the Go',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
