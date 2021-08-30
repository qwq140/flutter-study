import 'package:flutter/material.dart';
import 'package:flutter_airbnb/styles.dart';

class CommonFormField extends StatelessWidget {
  final prefixText;
  final hintText;

  // required 키워드는 선택적 매개변수 {} 안에서 꼭 받아야 하는 값을 설정할 수 있다.
  const CommonFormField({required this.prefixText, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          textAlignVertical: TextAlignVertical.bottom, // TextFormField 내부 세로 정렬
          decoration: InputDecoration(
              // TextFormField 내부에 패딩을 줄 수 있다.
              contentPadding: EdgeInsets.only(top: 30, left: 20, bottom: 10),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ))),
        ),
        Positioned(
          top: 8,
          left: 20,
          child: Text(
            prefixText,
            style: overline(),
          ),
        ),
      ],
    );
  }
}
