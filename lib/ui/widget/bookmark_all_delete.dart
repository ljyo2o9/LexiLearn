import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

allDelLog(_) {
  return showDialog(
    context: _,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color(0xFFED702D),
        title: Text(
          '전체 삭제가 완료 되었습니다.',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
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
