import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



void main() => runApp(MyApp());

// API로부터 데이터를 가져오는 함수
Future<List<User>> fetchUsers() async {
  // API 주소
  final apiUrl = 'http://127.0.0.1:3000/api/data';

  // GET 요청을 보내고 응답을 받음
  final response = await http.get(Uri.parse(apiUrl));

  // 응답을 JSON으로 디코딩하고 User 객체로 변환
  return (json.decode(response.body) as List)
      .map((e) => User.fromJson(e))
      .toList();
}

// User 객체를 정의하는 클래스
class User {
  final int user_id;
  final String phone;
  final String email;

  User({required this.user_id, required this.phone, required this.email});

  // JSON을 User 객체로 변환하는 팩토리 생성자
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['id'],
      phone: json['name'],
      email: json['email'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: FutureBuilder(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // 로딩 중 표시
            } else if (snapshot.hasError) {
              return Text('데이터를 불러오는 중 오류가 발생했습니다.');
            } else {
              // 데이터 사용하여 UI 업데이트
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(user.user_id.toString()),
                    ),
                    title: Text(user.phone),
                    subtitle: Text(user.email),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
