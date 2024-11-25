import 'package:flutter/material.dart';
import 'widgets.dart';
//이미지: 'assets/gps.png' - 해상도: 900 * 776
//색상: F8C71D9

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GpsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GpsPage extends StatefulWidget {
  @override
  _GpsPageState createState() => _GpsPageState();
}

class _GpsPageState extends State<GpsPage>{
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Where Am I?',
          style: TextStyle(
              color: Color(0xFF333333), fontWeight: FontWeight.bold),
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
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(0.0),
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Image.asset(
                    'assets/gps.png',
                    fit: BoxFit.none,
                  ),
                ),
                Icon(
                  Icons.gps_fixed,
                  size: 40,
                  color: Color(0xFFF8C71D9),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.white,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // itemlist로 넘어감
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF8C71D9),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Where to next?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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