import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _pushNotification = true;
  bool _sound = false;
  bool _vibration = false;
  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '마이페이지',
          style:
              TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.bold),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '  알림 설정',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.zero, // 카드의 기본 margin 제거
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  // 카드 내부에 패딩 추가
                  padding: const EdgeInsets.all(10.0), // 패딩을 추가하여 여백 확보
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('푸시 알림'),
                        value: _pushNotification,
                        activeColor:
                            const Color(0xFF8C71D9), // 스위치가 ON 상태일 때 색상 지정
                        onChanged: (bool value) {
                          setState(() {
                            _pushNotification = value;
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('소리'),
                        value: _sound,
                        activeColor:
                            const Color(0xFF8C71D9), // 스위치가 ON 상태일 때 색상 지정
                        onChanged: (bool value) {
                          setState(() {
                            _sound = value;
                          });
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('진동'),
                        value: _vibration,
                        activeColor:
                            const Color(0xFF8C71D9), // 스위치가 ON 상태일 때 색상 지정
                        onChanged: (bool value) {
                          setState(() {
                            _vibration = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '  개인정보 관리',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF777777),
                  ),
                ),
              ),
              Card(
                elevation: 0,
                color: Colors.white,
                margin: EdgeInsets.zero, // 카드의 기본 margin 제거
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  // 카드 내부에 패딩 추가
                  padding: const EdgeInsets.all(10.0), // 패딩을 추가하여 여백 확보
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('내 정보 관리'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        title: const Text('고객센터'),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        title: const Text('이용약관 동의'),
                        trailing: TextButton(
                          onPressed: () {
                            // '연결 해제' 버튼 클릭 시 실행될 코드 작성
                            dialog1();
                          },
                          child: const Text(
                            '자세히 보기',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF777777),
                              decoration: TextDecoration.underline, // 밑줄 추가
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Divider(
                          color: Color(0xFFBDBDBD),
                          thickness: 1,
                        ),
                      ),
                      ListTile(
                        title: const Text('개인정보 처리 방침'),
                        trailing: TextButton(
                          onPressed: () {
                            // '연결 해제' 버튼 클릭 시 실행될 코드 작성
                            dialog2();
                          },
                          child: const Text(
                            '자세히 보기',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF777777),
                              decoration: TextDecoration.underline, // 밑줄 추가
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                trailing: TextButton(
                  onPressed: () {
                    // '연결 해제' 버튼 클릭 시 실행될 코드 작성
                    logout();
                  },
                  child: const Text(
                    '로그아웃',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF999999),
                      decoration: TextDecoration.underline, // 밑줄 추가
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
    );
  }

  void dialog1() async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            '이용약관 동의',
            style: TextStyle(fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  '수집 대상 개인정보'
                  '\n\n이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.'
                  '\n※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」'
                  '\n\n개인정보 수집 목적'
                  '\n\n이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.'
                  '\n※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '확인',
                style: TextStyle(color: Color(0xFF8C71D9)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void dialog2() async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            '개인정보 처리 방침',
            style: TextStyle(fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  '제1조(목적)'
                  '\n\n이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.'
                  '\n※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」'
                  '\n\n제2조(관리)'
                  '\n\n이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '확인',
                style: TextStyle(color: Color(0xFF8C71D9)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            '  로그아웃 하시겠습니까?',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                '취소',
                style: TextStyle(color: Color(0xFF999999)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                '확인',
                style: TextStyle(color: Color(0xFF8C71D9)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
