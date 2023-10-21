import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FindingWordsPage extends StatelessWidget {
  const FindingWordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF1D1F21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1F21),
        elevation: 0,
        title: Text(
          '단어찾기',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w, bottom: 20.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 54.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2E30),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      //
                      /// 검색과 카메라
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '검색',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                          GestureDetector(
                            child: SvgPicture.asset(
                              'assets/image/camera.svg',
                              width: 24.w,
                              height: 22.h,
                            ),
                          )
                        ],
                      ),
                      //
                      /// Divider
                      Padding(
                        padding: EdgeInsets.only(top: 13.h, bottom: 18.h),
                        child: Container(
                          width: double.infinity,
                          height: 1.h,
                          color: const Color(0xFF595D62),
                        ),
                      ),
                      //
                      /// TextField
                      Center(
                        child: SizedBox(
                          height: 30.h,
                          child: TextField(
                            controller: _searchController,
                            maxLength: 1000,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                            ),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            /// 밑 화살표
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
              child: SvgPicture.asset(
                'assets/image/bottomArrow.svg',
                width: 20.w,
                height: 10.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
