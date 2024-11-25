import 'package:flutter/material.dart';
import 'widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LikePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LikePage extends StatefulWidget {
  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  int _currentIndex = 2; // 초기값: Cart 탭

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '내 관심 매장',
          style: TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF333333)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20), // AppBar와 이미지 사이에 20dp 간격 추가
            Center(
              child: Transform.scale(
                scale: 1.1, // 이미지를 확대
                child: Image.asset(
                  'assets/LikeImage.png', // 이미지 경로
                  width: 590, // 기본 너비 설정
                  height: 940, // 기본 높이 설정
                  fit: BoxFit.cover, // 비율을 유지하며 공간을 채움
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: buildBottomNavigationItems(_currentIndex),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xFFF8C71D9),
        unselectedItemColor: const Color(0xFFBDBDBD),
      ),
    );
  }
}
