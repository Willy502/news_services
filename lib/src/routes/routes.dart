import 'package:flutter/material.dart';
import 'package:news/src/pages/add_news_page.dart';
import 'package:news/src/pages/detail_news.dart';
import 'package:news/src/pages/login_page.dart';
import 'package:news/src/pages/news_page.dart';
import 'package:news/src/pages/splash_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    'splash' : (context) => SplashPage(),
    'login' : (context) => LoginPage(),
    'news' : (context) => NewsPage(),
    'add_news' : (context) => AddNewsPage(),
    'detail_news' : (context) => DetailNewsPage()
  };
}