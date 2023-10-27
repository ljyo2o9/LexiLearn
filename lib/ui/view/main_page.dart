import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:lexi_learn/ui/widget/ability_widget.dart';
import 'package:lexi_learn/ui/view_model/bookmark_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var abilityWidgetWid =
        ((MediaQuery.of(context).size.width.w - 62.w) / 2.w - 8.w);
    var bookmarkList = Provider.of<BookMarkViewModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1D1F21),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 31.w, right: 31.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// Logo
              Padding(
                padding: EdgeInsets.only(top: 91.h),
                child: SvgPicture.asset(
                  'assets/image/LexiLearn.svg',
                  width: 128.w,
                  height: 27.h,
                ),
              ),
              //
              /// 사용법
              Padding(
                padding: EdgeInsets.only(top: 51.h),
                child: Container(
                  width: 368.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFED702D),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Text - 사용법
                        Text(
                          '사용법',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: Text(
                            '모르는 단어는 단어찾기로!\n정확한 정보가 궁금하다면 위키요약으로!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// 기능
              Padding(
                padding: EdgeInsets.only(top: 52.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// 단어 찾기
                    GestureDetector(
                      onTap: () {
                        context.push('/findingWords');
                      },
                      child: abilityWidget(
                        abilityWidgetWid,
                        'wordIcon',
                        '단어찾기',
                        '모르는 단어를 AI에게 물어봐요!',
                      ),
                    ),

                    /// 위키요약
                    GestureDetector(
                      onTap: () {
                        context.push('/findingWiki');
                      },
                      child: abilityWidget(
                        abilityWidgetWid,
                        'wiki',
                        '위키요약',
                        '위키백과에 있는 일부 내용을 Ai가 요약해서 보여줘요!',
                      ),
                    ),
                  ],
                ),
              ),

              //
              /// 바로가기 버튼
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: GestureDetector(
                  onTap: () {
                    context.push('/bookmark');
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2E30),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: SvgPicture.asset(
                              'assets/image/return.svg',
                              width: 45.w,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '바로가기 생성',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                              ),
                              Text(
                                '자주 검색하는 경우 바로가기를 만들어요!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// 바로가기 Title
              Padding(
                padding: EdgeInsets.only(top: 52.h),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/image/bookmark.svg',
                      width: 22.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        '바로가기',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'NotoSansKR',
                          fontWeight: FontWeight.w500,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        bookmarkList.alldelete();
                      },
                      child: Container(
                        color: Colors.red,
                        width: 20.w,
                        height: 20.h,
                      ),
                    )
                  ],
                ),
              ),
              //
              /// List View
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: bookmarkList.bookmarkList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Container(
                      height: 110.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFED702D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //
                            /// BookMark Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //
                                /// Text ~에서
                                Text(
                                  bookmarkList.bookmarkList[index].state == true
                                      ? "단어찾기에서"
                                      : "위키요약에서",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24.sp,
                                  ),
                                ),
                                //
                                /// Delete
                                GestureDetector(
                                  onTap: () async {
                                    await bookmarkList.delBookMarkList(
                                      bookmarkList.bookmarkList[index].id,
                                    );

                                    await bookmarkList.getBookMarkList();
                                  },
                                  child: SvgPicture.asset(
                                    'assets/image/delete.svg',
                                    width: 15.w,
                                  ),
                                ),
                              ],
                            ),
                            //
                            /// title
                            Padding(
                              padding: EdgeInsets.only(top: 6.h),
                              child: Text(
                                '${bookmarkList.bookmarkList[index].title} - ${bookmarkList.bookmarkList[index].id}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'NotoSansKR',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
