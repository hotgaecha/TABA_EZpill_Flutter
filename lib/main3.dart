import 'package:mysql1/mysql1.dart';

void main() async {
  final MySqlConnection connection = await MySqlConnection.connect(ConnectionSettings(
    host: 'qqrx224.cgidx97t8k8h.ap-northeast-2.rds.amazonaws.com',
    port: 3306,
    user: 'BAEKI',
    db: 'Ezpill',
    password: 'qoqorlxo1!',
  ));

  try {
    // 데이터베이스에 쿼리 실행
    Results results = await connection.query('SELECT * FROM survey');

    // 결과 출력
    for (var row in results) {
      print('Row: $row');
    }
  } finally {
    // 연결 종료
    await connection.close();
  }
}
