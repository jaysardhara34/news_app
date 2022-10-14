import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:news_app/screen/news/provider/bissProvider.dart';
import 'package:news_app/screen/news/provider/newsProvider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BissSecond extends StatefulWidget {
  const BissSecond({Key? key}) : super(key: key);

  @override
  State<BissSecond> createState() => _BissSecondState();
}

class _BissSecondState extends State<BissSecond> {
  BisnessPro? apiproviderT;
  BisnessPro? apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<BisnessPro>(context, listen: false);
    apiproviderT = Provider.of<BisnessPro>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Color(0xff363535),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          LikeButton(
            size: 30,
            circleColor:
                CircleColor(start: Color(0xffb76060), end: Color(0xffa42929)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xffee4b4b),
              dotSecondaryColor: Color(0xffef2d2d),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
                size: 30,
              );
            },
          ),
          SizedBox(
            width: 7,
          ),
          IconButton(
              onPressed: () async {
                await Share.share('Check this Amazing News  ${apiproviderF!.Datapick!.url}',
                    );
              },
              icon: Icon(Icons.share)),
          SizedBox(
            width: 7,
          ),
          LikeButton(
            size: 30,
            circleColor:
                CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
            bubblesColor: BubblesColor(
              dotPrimaryColor: Color(0xff33b5e5),
              dotSecondaryColor: Color(0xff0099cc),
            ),
            likeBuilder: (bool isLiked) {
              return Icon(
                Icons.bookmark_border,
                color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                size: 30,
              );
            },
          ),
          SizedBox(
            width: 7,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "${apiproviderF!.Datapick!.title}",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: "${apiproviderF!.Datapick!.urlToImage}",
                        placeholder: (context, _) => Image.asset(
                            "assets/image/pexels-cottonbro-3944454.jpg"),
                        errorWidget: (context, _, __) => Image.asset(
                            "assets/image/pexels-cottonbro-3944454.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  color: Color(0xff363535),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                height: MediaQuery.of(context).size.height * 0.90,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffcccccc)),
                          height: 4,
                          width: 47,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 8),
                          child: Text(
                            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}   ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second} s",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.028),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.white60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Text(
                                  'Author : ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                  child: Text(
                                "    ${apiproviderF!.Datapick!.author}",
                                style: TextStyle(color: Colors.white),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 22),
                                child: Text(
                                  'Source : ',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                  child: Text(
                                "    ${apiproviderF!.Datapick!.source!.name}",
                                style: TextStyle(color: Colors.white),
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.white60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            "${apiproviderF!.Datapick!.description}",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.white60,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Text(
                            "${apiproviderF!.Datapick!.content}",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 2,
                      width: MediaQuery.of(context).size.width * 3,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            Color(0xffff5900),
                            Color(0xff00c4ff),
                            Color(0xffff00c3),
                          ])),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'news',
                            arguments: apiproviderF!.Datapick!.url);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Click here to read more news....",
                            style: TextStyle(color: Color(0xff3eccff)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
