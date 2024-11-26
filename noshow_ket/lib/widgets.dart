import 'package:flutter/material.dart';

List<BottomNavigationBarItem> buildBottomNavigationItems(int selectedIndex) {
  return [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: selectedIndex == 0
            ? const Color(0xFF8C71D9)
            : const Color(0xFFBDBDBD),
      ),
      label: '홈',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.location_on,
        color: selectedIndex == 1
            ? const Color(0xFF8C71D9)
            : const Color(0xFFBDBDBD),
      ),
      label: '주변',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
        color: selectedIndex == 2
            ? const Color(0xFF8C71D9)
            : const Color(0xFFBDBDBD),
      ),
      label: '좋아요',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.confirmation_num,
        color: selectedIndex == 3
            ? const Color(0xFF8C71D9)
            : const Color(0xFFBDBDBD),
      ),
      label: '예약',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.people,
        color: selectedIndex == 4
            ? const Color(0xFF8C71D9)
            : const Color(0xFFBDBDBD),
      ),
      label: '마이페이지',
    ),
  ];
}
