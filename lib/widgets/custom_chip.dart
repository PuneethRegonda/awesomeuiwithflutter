import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChipC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChipCState();
  }
}

class _ChipCState extends State<ChipC> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 6.0, right: 6.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(width: 5.0),
              Text('Chip',style: TextStyle(color: isSelected ? Colors.white : Colors.black),),
              SizedBox(width: 5.0)
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          gradient: isSelected
              ? LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF3B9ECF),
                Color(0xFF04C199),
              ])
              : LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(244, 244, 249, 1.0),
                Color.fromRGBO(244, 244, 249, 1.0),
              ]),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
    );
  }
}
