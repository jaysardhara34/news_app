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
    String newslike = "https://newsapi.org/v2/everything?q=$data&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}&sortBy=publishedAt&apiKey=9a17bf4238e64d38867439d521c6c0fb";
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  NewsModal.fromJson(newsjson);
  }
}