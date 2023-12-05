
import 'package:flutter/material.dart';

import 'my_home_page.dart';
//기본코드가 import하는 파일임!!


//main함수는 다트 언어에서의 시작점임.
void main() {
  runApp(const MyApp());
}




//클래스명은 낙타 표기법으로!!! MyApp
//파일명은 스네이크 표기법으로 my_app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //materialApp이란? 머터리얼 디자인을 가지는 앱을 만들때 기본으로 사용해야함.
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

