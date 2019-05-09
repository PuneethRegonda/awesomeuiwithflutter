import 'package:awesomeuiwithflutter/widgets/RatingBar.dart';
import 'package:awesomeuiwithflutter/widgets/bottom_nav_custom.dart';
import 'package:awesomeuiwithflutter/widgets/heropageroute.dart';
import 'package:awesomeuiwithflutter/widgets/profilePicCircular&boxGradient.dart';
import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Awesome UI Flutter",
  home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text("Awesome UI Flutter",style: TextStyle(letterSpacing:0.3,fontSize: 23.0,color: Colors.black,fontWeight: FontWeight.w500) ,),
    ),
    bottomNavigationBar: BottomNav(),
    body: getBody(),
  ),
));



Widget getBody(){

  List<WidgetShowCaseModel> list =[

    WidgetShowCaseModel(title: "Custome Bottom Navigation Bar",widget: BottomNav()),
    WidgetShowCaseModel(title: "Profile Picture",widget: ProfilePic()),
    WidgetShowCaseModel(title: "Raiting Bar",widget: RatingBar(rating: 4.5,)),
    WidgetShowCaseModel(title: "Hero Animation ",widget: ConstrainedBox(child: HeroAnimation(),constraints: BoxConstraints.tight(Size(350.0, 350.0)),)),
  ];




  return ListView.builder(
      itemCount: list.length,

      itemBuilder: (BuildContext context , int index ){

        return _tiles(list[index].title, list[index].widget);

      });
}

Widget _tiles(String title, Widget content) {
   return Padding(
    
    padding: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
    child: Card(
      elevation: 8.0,
      color: Colors.white,
      child: ExpansionTile(
        backgroundColor:Colors.blueGrey,
        title: Text(title,style: TextStyle(color: Colors.black,fontSize: 18.0,
            fontWeight: FontWeight.w700),),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: content,
          )
        ],
      ),
    ),
  );

}


class WidgetShowCaseModel {

  String title;
  Widget widget;

  WidgetShowCaseModel({@required this.title,@required this.widget});

}


//class HeroAnimation extends StatelessWidget {
//  Widget build(BuildContext context) {
//    timeDilation = 5.0; // 1.0 means normal animation speed.
//
//    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Basic Hero Animation'),
//        ),
//        body: Center(
//          child: Container(
//            child: PhotoHero(
//              photo: 'assets/ItsMe.jpg',
//              width: 300.0,
//              onTap: () {
//                Navigator.of(context).push(MaterialPageRoute<void>(
//                    builder: (BuildContext context) {
//                      return Scaffold(
//                          appBar: AppBar(
//                          title: const Text('Flippers Page'),
//                        ),
//                        body: Container(
//                          // The blue background emphasizes that it's a new route.
//                          color: Colors.lightBlueAccent,
//                          padding: const EdgeInsets.all(16.0),
//                          alignment: Alignment.topLeft,
//                          child: PhotoHero(
//                            photo: 'assets/ItsMe.jpg',
//                            width: 100.0,
//                            onTap: () {
//                              Navigator.of(context).pop();
//                            },
//                          ),
//                        ),
//                      );
//                    }
//                ));
//              },
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}