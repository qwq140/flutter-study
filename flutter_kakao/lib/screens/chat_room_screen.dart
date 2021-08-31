import 'package:flutter/material.dart';
import 'package:flutter_kakao/components/chat_icon_button.dart';
import 'package:flutter_kakao/components/my_chat.dart';
import 'package:flutter_kakao/components/other_chat.dart';
import 'package:flutter_kakao/components/time_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final List<MyChat> chats = []; // 내가 입력한 채팅 저장
  final TextEditingController _textController =
      TextEditingController(); // 내가 입력한 글을 제어하기 위한 컨트롤러, 이 앱에선 글 입력 후 완료 버튼을 누르면 입력 칸을 비어주기 위해 사용됨.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFb2c7da),
        child: Scaffold(
          backgroundColor: Colors.transparent, // 배경을 가리지 않게 투명색으로 지정
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "홍길동",
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              Icon(FontAwesomeIcons.search, size: 20),
              SizedBox(width: 25),
              Icon(FontAwesomeIcons.bars, size: 20),
              SizedBox(width: 25),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TimeLine(time: "2021년 1월 1일 금요일"),
                        OtherChat(
                            name: "홍길동",
                            text: "새해 복 많이 받으세요.",
                            time: "오전 10:10"),
                        MyChat(
                          text: "선생님도 많이 받으십시오.",
                          time: "오후 2:15",
                        ),
                        ...List.generate(
                            chats.length,
                            (index) => chats[
                                index]), // 이후 만들 채팅 입력 UI를 이용하여 chats에 새 글이 추가되면 화면에 나열
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                color: Colors.white,
                child: Row(
                  children: [
                    ChatIconButton(icon: Icon(FontAwesomeIcons.plusSquare)),
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: _textController,
                          maxLines: 1,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          onSubmitted:
                              _handleSubmitted, // 입력 후 완료 버튼을 눌렀을 때 일어나는 이벤트
                        ),
                      ),
                    ),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.smile)),
                    ChatIconButton(icon: Icon(FontAwesomeIcons.cog)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // input 클리어

    setState(() {
      // 입력을 하면 글이 chats에 추가되면서 화면에 그려지게 함
      chats.add(
        MyChat(
          text: text,
          time: DateFormat(
                  "a K:m") // intl 패키지를 이용한 날짜 포맷, 기본적으로 영어를 지원하기 때문에 AM, PM을 한글로 변경
              .format(new DateTime.now())
              .replaceAll("AM", "오전")
              .replaceAll("PM", "오후"),
        ),
      );
    });
  }
}
