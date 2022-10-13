import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/screen/news/modal/newsModal.dart';




class Api_Provider extends ChangeNotifier {

  Articles? Datapick;
  String searchdata = "apple";

  void changeData(String newdata)
  {
    searchdata =newdata;
    notifyListeners();
  }

  Future<NewsModal> Apifactory(String data) async {
    String newslike = "https://newsapi.org/v2/everything?q=$data&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=0bb4fd579918484bb3f75871c88a6f52";
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  NewsModal.fromJson(newsjson);
  }
}