import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:lexi_learn/ui/view_model/finding_words_view_model.dart';

class FindingWordsPage extends StatelessWidget {
  final String title;

  const FindingWordsPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    var getFindingWord = Provider.of<FindingWordsViewModel>(context);
    TextEditingController searchController = TextEditingController(text: title);

    return Scaffold(
      backgroundColor: const Color(0xFF1D1F21),
      //
      /// AppBar
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
        leading: GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      //
      /// Body
      body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              /// 검색과 카메라
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            /// 검색
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
                            /// 카메라
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
                          padding: EdgeInsets.only(top: 13.h, bottom: 10.h),
                          child: Container(
                            width: double.infinity,
                            height: 1.h,
                            color: const Color(0xFF595D62),
                          ),
                        ),
                        //
                        /// TextField
                        SizedBox(
                          child: TextField(
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //
              /// 밑 화살표
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                  child: SvgPicture.asset(
                    'assets/image/bottomArrow.svg',
                    width: 20.w,
                    height: 10.h,
                  ),
                ),
              ),
              //
              /// ~의 검색 결과
              getFindingWord.findingWordsList.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: SizedBox(
                        height: 30.h,
                        child: Text(
                          '${getFindingWord.findingWordsList[0].word.toString()}의 검색 결과',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              //
              /// 검색 결과
              getFindingWord.findingWordsList.isNotEmpty
                  ? SizedBox(
                      height: 380.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            getFindingWord.findingWordsList[0].wordInfo!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFED702D),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15.w),
                                child: Text(
                                  '${index + 1}. ${getFindingWord.findingWordsList[0].wordInfo![index].definition.toString()}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoSansKR',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 430.h,
                      child: Center(
                        child: Text(
                          '아직 데이터가 없습니다.',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'NotoSansKR',
                            fontWeight: FontWeight.w500,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),

              //
              /// 검색하기 버튼
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 18.h),
                child: GestureDetector(
                  onTap: () {
                    getFindingWord.getFindingWordsList(searchController.text);
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
