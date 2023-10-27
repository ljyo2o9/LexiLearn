import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:lexi_learn/ui/view_model/finding_wiki_view_model.dart';

import 'package:lexi_learn/ui/widget/finding_wiki_page_show_dialog.dart';

class FindingWikiPage extends StatelessWidget {
  const FindingWikiPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getFindingWiki = Provider.of<FindingWikiViewModel>(context);
    TextEditingController searchWikiController = TextEditingController();

    //
    /// AlertDialog (Wiki)
    openNotFindingWiki() {
      notFindingWiki(context);
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1D1F21),
      //
      /// AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D1F21),
        elevation: 0,
        title: Text(
          '위키요약',
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
                            controller: searchWikiController,
                            maxLength: 1000,
                            decoration: InputDecoration(
                              hintText: '적당한 문장도 좋아요 ex) 감자에 대해 알려줘',
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
              getFindingWiki.findingWikiList.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: SizedBox(
                        height: 30.h,
                        child: Text(
                          '${getFindingWiki.searchText}의 검색 결과',
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
              getFindingWiki.findingWikiList.isNotEmpty
                  ? SizedBox(
                      height: 380.h,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: getFindingWiki.findingWikiList.length,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${getFindingWiki.findingWikiList[index].answer}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'NotoSansKR',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 9.h),
                                          child: GestureDetector(
                                            onTap: () async {
                                              final url = Uri.parse(
                                                  getFindingWiki
                                                      .findingWikiList[index]
                                                      .url![0]);
                                              if (await canLaunchUrl(url)) {
                                                launchUrl(url);
                                              } else {
                                                openNotFindingWiki();
                                              }
                                            },
                                            child: Text(
                                              '더 보러가기',
                                              style: TextStyle(
                                                color: const Color(0xFFFFCB8A),
                                                fontFamily: 'NotoSansKR',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
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
                    getFindingWiki
                        .getFindingWikiList(searchWikiController.text);
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
