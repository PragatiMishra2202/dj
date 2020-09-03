import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/data/data.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gati',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }

  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 12.0 : 8.0,
      width: isCurrentPage ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.blue : Colors.blue[100],
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
          onPageChanged: (val){
            setState(() {
              currentIndex = val;
            });
          },
          itemBuilder: (context, index){
            return SliderTile(
              imageAssetPath1: slides[index].getImageAssetPath1(),
              title: slides[index].getTitle(),
              desc: slides[index].getdesc(),
              imageAssetPath: slides[index].getImageAssetPath(),
            );
          }
      ),
      bottomSheet: currentIndex != slides.length-1 ? Container(
          height: Platform.isAndroid ? 70 : 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                for(int i = 0; i < slides.length; i++) currentIndex == i ?pageIndexIndicator(true) : pageIndexIndicator(false)
              ],
            ),
            GestureDetector(
              onTap: (){
                pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.linear);
              },
              child: Text("NEXT >", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,),
            )
            )
          ],
        ),
      ) : Container(
        height: Platform.isAndroid ? 70 : 60,
        alignment: Alignment.centerRight,
        child: Text("GET STARTED!  >", style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,

        ),
        ),
      ),
    );
  }
}

class SliderTile extends StatelessWidget{

  String imageAssetPath1, title, desc,imageAssetPath;
  SliderTile({this.imageAssetPath1, this.title, this.desc, this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageAssetPath1,
            height: 64,
            width: 140,

          ),
          SizedBox(height: 20,),
          Text(title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600
              ),
            )
          ),
          SizedBox(height: 12,),
          Text(desc, style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
          ),
          Image.asset(
              imageAssetPath,

          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
