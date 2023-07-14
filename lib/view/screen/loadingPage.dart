import 'dart:async';

import 'package:afirmation/main.dart';
import 'package:afirmation/view/screen/welcome.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AfirmationApp(),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff7D2DC5),
        child: const Center(
          child: SizedBox(
            width: 43,
            height: 43,
            child: CircularProgressIndicator(
              strokeWidth: 6,
              color: Color(0xffFFFFFF),
              backgroundColor: Color(0xff8A42CB),
            ),
          ),
        ),
      ),
    );
  }
}
