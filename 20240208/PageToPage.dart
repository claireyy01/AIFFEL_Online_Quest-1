// import 문장: Flutter에서 필요한 라이브러리를 가져옴
import 'package:flutter/material.dart';

// 앱의 진입점을 정의하는 main 함수
void main() {
  // MyApp 위젯을 실행하여 앱을 시작
  runApp(MyApp());
}

// 앱의 기본 위젯을 정의하는 MyApp 클래스
class MyApp extends StatelessWidget {
  // MyApp 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // MaterialApp을 반환하여 앱의 전반적인 머티리얼 디자인을 적용
    return MaterialApp(
      // 앱의 홈 화면을 FirstPage 위젯으로 설정
      home: FirstPage(),
    );
  }
}

// 첫 번째 페이지를 정의하는 FirstPage 클래스
class FirstPage extends StatelessWidget {
  // FirstPage 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // 고양이 여부를 나타내는 변수를 초기화
    bool is_cat = true;
    // Scaffold 위젯을 반환하여 머티리얼 디자인의 기본 구조를 생성
    return Scaffold(
      // 앱 바를 생성하고 제목과 아이콘을 설정
      appBar: AppBar(
        title: Text('First Page'),  // 앱 바의 제목 설정
        leading: Icon(Icons.pets),  // 앱 바의 왼쪽에 고양이 아이콘 추가
      ),
      // 바디 부분을 생성하여 화면 중앙에 컬럼을 배치
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 다음 페이지로 이동하는 버튼 위젯 생성
            ElevatedButton(
              child: Text('Next'),  // 버튼 텍스트 설정
              onPressed: () {
                print(is_cat);  // 디버그 콘솔에 고양이 여부 출력
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(isCat: false),  // 두 번째 페이지로 이동하고 고양이 여부를 false로 설정하여 전달
                  ),
                );
              },
            ),
            SizedBox(height: 20),  // 간격 추가
            Image.asset(
              './assets/cat.jpg',  // 고양이 이미지를 출력
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

// 두 번째 페이지를 정의하는 SecondPage 클래스
class SecondPage extends StatelessWidget {
  // 첫 번째 페이지에서 전달받은 고양이 여부를 저장하는 변수
  final bool isCat;

  // 생성자를 통해 isCat 변수를 초기화
  SecondPage({required this.isCat});

  // SecondPage 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯을 반환하여 머티리얼 디자인의 기본 구조를 생성
    return Scaffold(
      // 앱 바를 생성하고 제목을 설정
      appBar: AppBar(
        title: Text('Second Page'),  // 앱 바의 제목 설정
      ),
      // 바디 부분을 생성하여 화면 중앙에 컬럼을 배치
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 이전 페이지로 돌아가는 버튼 위젯 생성
            ElevatedButton(
              child: Text('Back'),  // 버튼 텍스트 설정
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            SizedBox(height: 20),  // 간격 추가
            Image.asset(
              './assets/dog.jpg',  // 강아지 이미지를 출력 (이미지 파일 경로에 맞게 수정 필요)
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
