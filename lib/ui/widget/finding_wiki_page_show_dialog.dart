import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

notFindingWiki(_) async {
  return showDialog(
    context: _,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFED702D),
        title: Text(
          '이 검색 결과는 더 보러 갈 수 없습니다.',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
            fontSize: 22.sp,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              '확인',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
          )
        ],
      );
    },
  );
}
