import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//void main() {
//  runApp(MaterialApp(
//    home: BottomNav(),
//  ));
//}

double iconSize = 30.0,textSize=14.0;
Color iconColor = Colors.blue,textColor = Colors.blue;
int focusOn = 0,animDuration = 700;
Curve animCurve = Curves.linearToEaseOut;

List<BottomNavItemCustomDataModel> _inputData = [
  BottomNavItemCustomDataModel(title: 'Home', icon: Icons.home),
  BottomNavItemCustomDataModel(title: 'Search', icon: Icons.search),
  BottomNavItemCustomDataModel(title: 'Books', icon: Icons.book),
  BottomNavItemCustomDataModel(title: 'Profile', icon: Icons.person),
];

class BottomNav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

List<Widget> _bottomNavItems = [];

class _BottomNavState extends State<BottomNav> {
  Widget _buildChip(int i) {
    return Expanded(
      flex: 3,
      child: AnimatedContainer(
        duration: Duration(milliseconds: animDuration),
        curve: animCurve,
        child: InkWell(
          onTap: () {
            setState(() {
              focusOn = i;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child:
                Icon(_inputData[i].icon, color: iconColor, size: iconSize),
          ),
        ),
      ),
    );
  }

  Widget _buildFocussedChip(int i) {
    return Expanded(
      flex: 4,
      child: AnimatedContainer(
          duration: Duration(milliseconds: animDuration),
          curve: animCurve,
          child: InkWell(
            onTap: () {
              print('Chip $i tapped');
              setState(() {
                focusOn = i;
              });
            },
            child: Card(
              elevation: 3.0,
              margin: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 5.0),
                    Icon(_inputData[i].icon,
                        color: iconColor, size: iconSize),
                    SizedBox(width: 3.0),
                    Text(_inputData[i].title,style: TextStyle(fontSize: textSize,color: textColor)),
                    SizedBox(width: 5.0)
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildNavBar() {
    _bottomNavItems.clear();
    for (int i = 0; i < _inputData.length; i++) {
      if (i == focusOn)
        _bottomNavItems.add(_buildFocussedChip(i));
      else
        _bottomNavItems.add(_buildChip(i));
    }

    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.2),),
      child: Padding(padding: EdgeInsets.all(5.0),child: Row(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.center, children: _bottomNavItems),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNavBar();
  }
}

class BottomNavItemCustomDataModel {
  String title;
  IconData icon;

  BottomNavItemCustomDataModel({this.title, this.icon});
}
