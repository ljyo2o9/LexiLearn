import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lexi_learn/data/model/bookmark_model.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:lexi_learn/ui/view_model/finding_words_view_model.dart';
import 'package:lexi_learn/ui/view_model/finding_wiki_view_model.dart';
import 'package:lexi_learn/ui/view_model/bookmark_view_model.dart';
import 'package:lexi_learn/ui/view_model/widget_set_state.dart';

import 'package:lexi_learn/ui/view/main_page.dart';
import 'package:lexi_learn/ui/view/finding_words_page.dart';
import 'package:lexi_learn/ui/view/finding_wiki_page.dart';
import 'package:lexi_learn/ui/view/bookmark_page.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const MainPage(),
    ),
    GoRoute(
      path: '/findingWords',
      builder: (_, state) => const FindingWordsPage(title: ''),
    ),
    GoRoute(
      path: '/findingWiki',
      builder: (context, state) => const FindingWikiPage(title: ''),
    ),
    GoRoute(
      path: '/bookmark',
      builder: (context, state) => const BookMarkPage(),
    )
  ],
);

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookMarkModelAdapter());

  await Hive.openBox<BookMarkModel>('bookmark');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FindingWordsViewModel()),
        ChangeNotifierProvider(create: (context) => FindingWikiViewModel()),
        ChangeNotifierProvider(create: (context) => BookMarkViewModel()),
        ChangeNotifierProvider(create: (context) => WidgetSetState()),
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
