import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'widgets.dart';
import 'gps.dart';
import 'like_list.dart';
import 'mypage.dart';
import 'reservation_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> carouselImages = [
    'assets/cookies.png',
    'assets/pottery.jpg',
  ];

  int _currentIndex = 0;
  int _carouselIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    GpsPage(),
    LikePage(),
    ReservationPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOSHOW-KET',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: _currentIndex == 0
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 상단 이미지 배너
                  CarouselSlider(
                    items: carouselImages.map((imagePath) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          const Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "TODAY'S PICK",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "오늘의 노쇼켓을 만나보세요.",
                                  style: TextStyle(
                                    fontSize: 16.5,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 280,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _carouselIndex = index;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselImages.asMap().entries.map((entry) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: _carouselIndex == entry.key ? 12 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _carouselIndex == entry.key
                              ? const Color(0xFF8C71D9)
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),

                  // 검색 바
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF0F0F0),
                              hintText: 'Search',
                              hintStyle:
                                  const TextStyle(color: Color(0xFF777777)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // icon 5개
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0), // 좌우 여백 추가
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // 요소 간 균등 간격
                      children: [
                        buildCategoryItem('assets/food.png', '먹거리'),
                        buildCategoryItem('assets/class.jpg', '원데이클래스'),
                        buildCategoryItem('assets/show.jpg', '공연'),
                        buildCategoryItem('assets/beauty.png', '뷰티'),
                        buildCategoryItem('assets/etc.png', '기타'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '오늘의 핫딜',
                          style: TextStyle(
                            fontSize: 20, // 텍스트 크기
                            fontWeight: FontWeight.bold, // 텍스트 굵기
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(left: 20.0),

                    scrollDirection: Axis.horizontal, // 가로로 스크롤
                    child: Row(
                      children: [
                        buildRoundedImage('assets/onedayPottery.jpg'),
                        buildRoundedImage('assets/pibu.jpg'),
                        buildRoundedImage('assets/wood.jpeg'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : _pages[_currentIndex],
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

  Widget buildCardItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8C71D9).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildCategoryItem(String imagePath, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, // Column 크기 축소
    children: [
      Container(
        width: 60, // 원형 아이콘 크기
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200], // 배경색
          shape: BoxShape.circle, // 원형 배경
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // 이미지 크기 맞춤
          ),
        ),
      ),
      const SizedBox(height: 8), // 아이콘과 텍스트 간 간격
      Text(
        label,
        style: const TextStyle(
          fontSize: 12, // 텍스트 크기
          fontWeight: FontWeight.w500, // 텍스트 굵기
        ),
      ),
    ],
  );
}

Widget buildRoundedImage(String imagePath) {
  return Container(
    margin: const EdgeInsets.only(right: 16), // 이미지 간 간격
    width: 330, // 이미지 너비
    height: 185, // 이미지 높이
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.cover, // 이미지를 꽉 채우기
      ),
      borderRadius: BorderRadius.circular(16), // 둥근 모서리 처리
    ),
  );
}
