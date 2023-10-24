import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Container abilityWidget(var abilityWidgetWid, picture, title, content) {
  return Container(
    width: abilityWidgetWid,
    decoration: BoxDecoration(
      color: const Color(0xFF2C2E30),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          /// 단어 찾기 아이콘
          Padding(
            padding: EdgeInsets.only(top: 17.h),
            child: Center(
              child: SvgPicture.asset(
                'assets/image/${picture}.svg',
                width: 45.w,
                height: 45.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.h),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NotoSansKR',
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 20.h),
            child: SizedBox(
              height: 72.h,
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NotoSansKR',
                  fontWeight: FontWeight.w500,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
