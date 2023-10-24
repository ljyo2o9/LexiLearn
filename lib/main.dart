import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:lexi_learn/ui/view_model/finding_words_view_model.dart';

import 'package:lexi_learn/ui/view/main_page.dart';
import 'package:lexi_learn/ui/view/finding_words_page.dart';
import 'package:lexi_learn/ui/view/finding_wiki_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const MainPage(),
    ),
    GoRoute(
      path: '/findingWords',
      builder: (_, state) => const FindingWordsPage(),
    ),
    GoRoute(
      path: '/findingWiki',
      builder: (context, state) => const FindingWikiPage(),
    )
  ],
);

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FindingWordsViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
        );
      },
    );
  }
}
