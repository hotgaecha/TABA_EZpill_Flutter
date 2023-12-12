import 'package:mysql_client/mysql_client.dart';

Future<void> dbConnector() async {
  print("Connecting to mysql server...");

  // MySQL 접속 설정
  final conn = await MySQLConnection.createConnection(
    host: 'qqrx224.cgidx97t8k8h.ap-northeast-2.rds.amazonaws.com',
    port: 3306,
    userName: 'BAEKI',
    password: 'Qoqorlxo1!',
    databaseName: 'Ezpill', // optional
  );

  // 연결 대기
  await conn.connect();

  print("Connected");

  // 종료 대기
  await conn.close();
}
