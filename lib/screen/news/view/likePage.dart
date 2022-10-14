import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/newsProvider.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  Api_Provider? cartProviderT;
  Api_Provider? cartProviderF;

  @override
  Widget build(BuildContext context) {
    cartProviderF = Provider.of<Api_Provider>(context, listen: false);
    cartProviderT = Provider.of<Api_Provider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff363535),
          title: Text("Like"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hear is all posts that you liked",style: TextStyle(color: Colors.white),),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartProviderF!.cart.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
