
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/news/view/first.dart';
import 'package:news_app/screen/news/view/screens/bisness.dart';
import 'package:news_app/screen/news/view/screens/entertainment.dart';
import 'package:news_app/screen/news/view/screens/health.dart';
import 'package:news_app/screen/news/view/screens/india.dart';
import 'package:news_app/screen/news/view/screens/sportsFirst.dart';
import 'package:news_app/screen/news/view/screens/techScreen.dart';


class api_tabbar extends StatefulWidget {
  const api_tabbar({Key? key}) : super(key: key);

  @override
  State<api_tabbar> createState() => _api_tabbarState();
}

class _api_tabbarState extends State<api_tabbar> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7, // length of tabs
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar:AppBar(
            backgroundColor: Color(0xff363535),
            centerTitle: false,
            title: Text("24/7 News"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
            ],
            bottom:TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16.0),
              tabs: [
                Tab(text: "TOP NEWS"),
                Tab(text: "COUNTRY"),
                Tab(text: "HEALTH"),
                Tab(text: "BUSINESS"),
                Tab(text: "ENTERTAINMENT"),
                Tab(text: "SPORTS"),
                Tab(text: "TECHNOLOGY"),
              ],
            ),

          ),
          body: TabBarView(
            children: [
              newsApi_FirstScreen(),
              IndiaScreen(),
              HealthScreen(),
              BussScreen(),
              EntScreen(),
              SportScreen(),
              TechScreen(),

            ],
          ),
        ),

      ),
    );


  }
}