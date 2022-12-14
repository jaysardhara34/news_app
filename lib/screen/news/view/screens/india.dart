import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screen/news/modal/newsModal.dart';
import 'package:news_app/screen/news/provider/indProvider.dart';
import 'package:news_app/screen/news/provider/newsProvider.dart';
import 'package:provider/provider.dart';


class IndiaScreen extends StatefulWidget {
  const IndiaScreen({Key? key}) : super(key: key);

  @override
  State<IndiaScreen> createState() => _IndiaScreenState();
}

class _IndiaScreenState extends State<IndiaScreen> {

  final blue = const Color(0xff69695f);
  final backgroundLightFont = const Color(0xFF090909);



  IndProvider? apiproviderT;
  IndProvider? apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<IndProvider>(context, listen: false);
    apiproviderT = Provider.of<IndProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              SizedBox(height: 10,),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Button("india"),
                    Button("us"),
                    Button("philippines"),
                    Button("china"),
                    Button("korea"),
                    Button("japan"),
                    Button("russia"),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Expanded(
                child: FutureBuilder<NewsModal>(
                  future: apiproviderF!.Apifactory("${apiproviderT!.searchdata}"),//
                  builder: (context, snapshot)
                  {
                    if (snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData)
                    {
                      NewsModal apimodel = snapshot.data!;
                      return ListView.builder(
                        itemCount: apimodel.articles!.length,
                        itemBuilder: (context, index)
                        {
                          return InkWell(onTap: (){
                            apiproviderF!.Datapick = apimodel.articles![index];
                            Navigator.pushNamed(context, 'isecode');
                          },
                            child: Column(
                              children: [
                                SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      children: [
                                        Container(padding: EdgeInsets.symmetric(horizontal: 8),height: 65,width: MediaQuery.of(context).size.width*0.45,child: Text("${apimodel.articles![index].title}",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),)),
                                        SizedBox(height: 8,),
                                        Container(padding: EdgeInsets.symmetric(horizontal: 8),height: 65,width: MediaQuery.of(context).size.width*0.45,child: Text("${apimodel.articles![index].description}",style: TextStyle(color: Colors.white60),)),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        height: 140,
                                        width: MediaQuery.of(context).size.width*0.45,
                                        fit: BoxFit.cover,
                                        imageUrl: "${apimodel.articles![index].urlToImage}",
                                        placeholder: (context,_)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                                        errorWidget: (context,_,__)=>Image.asset("assets/image/pexels-cottonbro-3944454.jpg"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40,)
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget Button(String text)
  {
    return InkWell(onTap: (){
      apiproviderF!.changeData(text);
    },
      child: Container(
        height: 30,
        width: 80,
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Text("$text",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: text == apiproviderF!.searchdata ? blue : backgroundLightFont,

        ),
      ),
    );
  }
}