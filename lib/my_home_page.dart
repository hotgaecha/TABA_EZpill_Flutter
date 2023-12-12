//stful 명령어를 사용해서 stateful Widget을 빠르게 생성함
//새로운 화면을 띄우기 위해서는 필수적인 요소임.
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MainPage();
}

class MainPage extends State<MyHomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    //const Placeholder 대신 Container가 들어가면 격자 없는 검은 화면임.
    //Container --> 검은 도화지
    //Scaffold  --> 흰 도화지
    //const Placeholder  --> 검은 도화지와 대각선 격자.
    // return Scaffold(이 안에다가 도화지에 채울 내용을 넣는것임.);
    return Scaffold(
      appBar: AppBar(
        title: Text('홈'),
      ),
      //여기서도 Center옵션을 줬기 떄문에 가운데 열에 숫자가 나타나는것임.
      //이때 옵션을 없애고 싶을때는 Center앞에 커서를 두고 option+엔터를 입력하면 리무브 위젯을 고르면 된다.
      body: Center(
        //Text 앞에 option+엔터를 입력하면 간단하게 Column으로 감쌀 수 있다.
        //Column에 여러개 넣게 되면 위아래로 여러개가 생긴다.
        //Row도 가능함.
        //스크롤이 가능하게 하는 SingleChildScrollBView
        child: SingleChildScrollView(
          child: Column(
            //열 또는 행에 정렬에 대한 옵션을 넣어줄 수 있다.
            //center, end 등등의 옵션이 있음.
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 100,
                height: 50,
              ),
              //그냥 사이즈 채우는 박스 만들기
              SizedBox(
                height: 30,
              ),
              Container(
                height: 30,
              ),
              Text(
                '숫자',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                '$count',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Elevated Button');
                },
                child: Text('ElevatedButton'),
              ),
              TextButton(
                onPressed: () {
                  print('Text Button');
                },
                child: Text('TextButton'),
              ),
              OutlinedButton(
                onPressed: () {
                  print('OutlinedButton');
                },
                child: Text('OutlinedButton'),
              ),
              //유저 입력을 받는 빈칸은 TextField를 사용!\

              //텍스트 필드옆에 로그인 버튼을 만들자
              //원래 텍스트 필드는 칸을 꽉채워 쓰기 떄문에 Row와 함께 쓰면 에러가 난다.
              //따라서 사이즈를 지정해주며 사용해야함,
              //이때 SizedBox, Container, Expanded등을 사용할수 있음.
              //Expanded 사용시 flex옵션을 사용하여 비율을 조정할수 있다. (언급하지 않으면 flex는 1이 기본값임)
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: '글자',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        print(text);
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {print('login Button');},
                      child: Text('login'),
                    ),
                  ),
                ],
              ),
              //이미지를 넣어보자!! Image.network('경로')
              Image.network(
                'https://i.namu.wiki/i/w11dbZZeomJI4bD3_KItw3vq7tgglcM1YQA_xHULxMsixPpY1S7KcB8WrEFhJNuSuejiiQkicGKMH12JvpUqBQ.webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/1.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed안에는 눌렀을때 처리 되는 로직을 넣어!!!
        onPressed: () {
          //문장의 끝에는 꼭 세미콜론이 필요함
          // onPressed 밖에는 전체가 body에 대한 내용으로 한줄인것임. Scaffold의 끝에 ;(세미콜론)이 존재함.
          print('클릭');
          // count++;
          //카운트를 늘려도 밑에처럼 setState()를 넣어주지 않으면 업데이트 안됨.
          setState(() {
            //화면 갱신 코드
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
