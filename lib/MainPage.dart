import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:key2iqassign/screens/quiz/quiz_screen.dart';
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainPage(),
      routes: {
        '/coursePage' : (context)=>QuizScreen(),
      },
    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {

  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(

        key: _bottomNavigationKey,
        index: 1,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white,),
          Icon(Icons.people_outline_outlined, size: 30,color: Colors.white,),
          Icon(Icons.account_circle, size: 30,color: Colors.white,),

        ],
        color: Colors.red[300],
        buttonBackgroundColor: Colors.redAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedindex) {
          setState(() {

          });
        },

      ),
      backgroundColor: Color(0xfff4f6fd),
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Color(0xff2657ce),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.emoji_events,
                          color: Color(0xff2657ce).withOpacity(0.5),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.explore_rounded,
                          color: Color(0xff2657ce).withOpacity(0.5),
                          size: 30,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.thumb_up_alt,
                          color: Color(0xff2657ce).withOpacity(0.5),
                          size: 30,
                        ),
                      ),

              ],
            ),
            SizedBox(height: 25,),
            Text('What do you want to do....', style: TextStyle(
              fontSize: 30,
              height: 1.3,
              fontWeight: FontWeight.w700
            ),),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child:InkWell(
                        onTap:(){openCoursePage();},
                        child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          courseWidget('Compete Now', 'Challenge for you', 'img1', Color(0xffff6a65), Color(0xffff5954)),
                          SizedBox(height: 20,),
                          courseWidget('Meet New Rappers', 'Chat with other', 'img2', Color(0xffe9eefa), Colors.white),
                        ],
                      ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(height: 50,),
                          courseWidget('Explore', 'see rappers like you', 'img3', Color(0xffe9eefa), Colors.white),
                          SizedBox(height: 20,),
                          courseWidget('Play And Learn', 'learn in funway', 'img4', Color(0xffbdcddfa), Color(0xffcedaff)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Container courseWidget(String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: InkWell(
       // onTap: (){openCoursePage();},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.all(Radius.circular(20)),

              ),
              child: Text('$category', style: TextStyle(
                color: (categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) : Colors.white)
              ),),
            ),
            SizedBox(height: 10,),
            Text('$title', style: TextStyle(
              color: (bgColor == Color(0xffff5954)) ? Colors.white : Colors.black,
              fontSize: 20,
              height: 1,
            ),),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 100,
                  color: (bgColor == Color(0xffff5954)) ? Colors.red : Color(0xff2657ce),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    color: (bgColor == Color(0xffff5954)) ? Colors.white.withOpacity(0.5) : Color(0xff2657ce).withOpacity(0.5),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Hero(
              tag: '$img',
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/$img.png'),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void openCoursePage()
  {
    Navigator.pushNamed(context, '/coursePage', arguments: {});
  }
}
