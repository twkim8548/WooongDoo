// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:application/home.dart';
import 'package:application/randomWord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  Timer(const Duration(seconds: 3), () {
    // FlutterNativeSplash.remove();
  });
  // flutter_native_splash를 사용하여 네이티브 코드에 스플래시 화면을 삽입, 버벅거림 없애기
  // 자동로그인 시 preserve / remove 를 사용하면 될듯
  FlutterNativeSplash.remove();

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const Home(),
    );
  }
}
