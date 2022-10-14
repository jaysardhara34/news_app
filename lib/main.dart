import 'package:flutter/material.dart';
import 'package:news_app/screen/news/provider/bissProvider.dart';
import 'package:news_app/screen/news/provider/healthProvider.dart';
import 'package:news_app/screen/news/provider/indProvider.dart';
import 'package:news_app/screen/news/provider/newsProvider.dart';
import 'package:news_app/screen/news/view/Tabbar.dart';
import 'package:news_app/screen/news/view/bookmarkPage.dart';
import 'package:news_app/screen/news/view/botomScreen.dart';
import 'package:news_app/screen/news/view/first.dart';
import 'package:news_app/screen/news/view/likePage.dart';
import 'package:news_app/screen/news/view/newsPage.dart';
import 'package:news_app/screen/news/view/second.dart';
import 'package:news_app/screen/news/view/secondScreens/bissNess.dart';
import 'package:news_app/screen/news/view/secondScreens/enterSecond.dart';
import 'package:news_app/screen/news/view/secondScreens/hScreen.dart';
import 'package:news_app/screen/news/view/secondScreens/indSecond.dart';
import 'package:news_app/screen/news/view/secondScreens/sportsSecond.dart';
import 'package:news_app/screen/news/view/secondScreens/techSecond.dart';
import 'package:news_app/screen/news/view/splashScreen.dart';
import 'package:provider/provider.dart';
import 'screen/news/provider/botomProvider.dart';
import 'screen/news/provider/entProvider.dart';
import 'screen/news/provider/sportsProvider.dart';
import 'screen/news/provider/techProvider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ListenableProvider<Api_Provider>(create: (context)=>Api_Provider()),
          ListenableProvider<bootam_Provider>(create: (context)=>bootam_Provider()),
          ListenableProvider<IndProvider>(create: (context)=>IndProvider()),
          ListenableProvider<HProvider>(create: (context)=>HProvider()),
          ListenableProvider<BisnessPro>(create: (context)=>BisnessPro()),
          ListenableProvider<EnterProvider>(create: (context)=>EnterProvider()),
          ListenableProvider<SportsProvider>(create: (context)=>SportsProvider()),
          ListenableProvider<TechProvider>(create: (context)=>TechProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context)=>SplashScreen(),
            'main':(context)=>bottomber_Screen(),
            'tab':(context)=>api_tabbar(),
            'shoptwo':(context)=>newsApi_FirstScreen(),
            'secode':(context)=>news_apisecode(),
            'isecode':(context)=>IndSec(),
            'hsecode':(context)=>HSec(),
            'bsecode':(context)=>BissSecond(),
            'esecode':(context)=>EnterSecond(),
            'ssecode':(context)=>SportSecond(),
            'tsecode':(context)=>TechSecond(),
            'news':(context)=>WebView_Screen(),
            'like':(context)=>LikePage(),
            'book':(context)=>BookmarkPage(),
          },
        ),
      )
  );
}