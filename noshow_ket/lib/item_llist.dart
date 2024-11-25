import 'package:flutter/material.dart';
import 'widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int _currentIndex = 1; // 초기값: Cart 탭

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '먹거리',
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
                scale: 1.3, // 이미지를 확대
                child: Image.asset(
                  'assets/ItemListImage.png', // 이미지 경로
                  width: 600, // 기본 너비 설정
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
