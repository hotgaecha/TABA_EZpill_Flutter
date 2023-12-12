class MyData {
  final int id;
  final String name;
  // 다른 속성들 추가

  MyData({
    required this.id,
    required this.name,
    // 다른 속성들 초기화
  });

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      id: json['id'],
      name: json['name'],
      // 다른 속성들 추가
    );
  }
}
