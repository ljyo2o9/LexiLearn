import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:lexi_learn/ui/view_model/widget_set_state.dart';
import 'package:lexi_learn/ui/view_model/bookmark_view_model.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    var widgetSetState = Provider.of<WidgetSetState>(context);
    var bookmarkList = Provider.of<BookMarkViewModel>(context);
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF1D1F21),
      //
      /// AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1F21),
        elevation: 0,
        title: Text(
          '바로가기 생성',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      //
      /// Body
      body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w, bottom: 20.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 31.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        widgetSetState.selectWord();
                      },
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: widgetSetState.cnt == 1
                              ? const Color(0xFFED702D)
                              : const Color(0xFF2C2E30),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '단어찾기',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        widgetSetState.selectWiki();
                      },
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: widgetSetState.cnt == 0
                              ? const Color(0xFFED702D)
                              : const Color(0xFF2C2E30),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            '위키요약',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 31.h),
                child: Container(
                  width: double.infinity,
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
                        /// 검색과 카메라
                        Text(
                          '검색',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                        //
                        /// Divider
                        Padding(
                          padding: EdgeInsets.only(top: 13.h, bottom: 10.h),
                          child: Container(
                            width: double.infinity,
                            height: 1.h,
                            color: const Color(0xFF595D62),
                          ),
                        ),
                        //
                        /// TextField
                        TextField(
                          controller: searchController,
                          maxLength: 1000,
                          decoration: InputDecoration(
                            hintText: '단어로 검색해주세요 ex) 당근, 감자',
                            hintStyle: TextStyle(
                              color: const Color(0xFF7D8083),
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                            ),
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 430.h),
              //
              /// 검색하기 버튼
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 18.h),
                child: GestureDetector(
                  onTap: () async {
                    await bookmarkList.postBookMarkList(
                        0,
                        searchController.text,
                        widgetSetState.cnt == 1 ? true : false);

                    await bookmarkList.getBookMarkList();

                    context.go('/');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFED702D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 19.h, bottom: 19.h),
                      child: Center(
                        child: Text(
                          '검색하기',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
