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
          'Item Page',
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
      body: Center(
        // 이미지 가운데 정렬
        child: Image.asset(
          'assets/ItemList.png', // 이미지 경로 수정 필요
          fit: BoxFit.contain, // 이미지 크기 조정
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
