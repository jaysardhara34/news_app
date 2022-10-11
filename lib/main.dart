
import 'package:flutter/material.dart';
import 'package:news_app/screen/news/provider/newsProvider.dart';
import 'package:news_app/screen/news/view/Tabbar.dart';
import 'package:news_app/screen/news/view/botomScreen.dart';
import 'package:news_app/screen/news/view/first.dart';
import 'package:news_app/screen/news/view/newsPage.dart';
import 'package:news_app/screen/news/view/second.dart';
import 'package:news_app/screen/news/view/splashScreen.dart';
import 'package:provider/provider.dart';

import 'screen/news/provider/botomProvider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ListenableProvider<Api_Provider>(create: (context)=>Api_Provider()),
          ListenableProvider<bootam_Provider>(create: (context)=>bootam_Provider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context)=>SplashScreen(),
            'main':(context)=>bottomber_Screen(),
            'tab':(context)=>api_tabbar(),
            'shoptwo':(context)=>newsApi_FirstScreen(),
            'secode':(context)=>news_apisecode(),
            'news':(context)=>WebView_Screen(),
          },
        ),
      )
  );
}