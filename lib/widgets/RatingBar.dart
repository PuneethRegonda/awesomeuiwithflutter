import 'package:flutter/material.dart';


class RatingBar extends StatelessWidget {

  final double rating;
  final  Color color;
  const RatingBar({
    Key key,
    @required this.rating, this.color,
  }) : super(key: key);

  final Color dcolor = Colors.orange;

 List<Widget> starMaker(double rating){
    List<Widget> stars =[
      SizedBox(width: 4.0,)
    ];
    for(int i=0;i<rating.toInt();i++){
     stars.add(Icon(Icons.star,color: color==null?Colors.orange:color,size: 20.0,),);
    }
    ///adding half_star if needed
    if(rating.toInt().toDouble()<rating)
      stars.add(Icon(Icons.star_half,color: color==null?Colors.orange:color,size: 20.0,),);
    stars.add(SizedBox(width: 4.0,));
    return stars;

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70,width: 0.5,style: BorderStyle.solid,),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: starMaker(rating),
//        children: <Widget>[
//          SizedBox(width: 3.0,),
//
//          Icon(Icons.star,color: Colors.orange,size: 20.0,),
//          Icon(Icons.star,color: Colors.orange,size: 20.0,),
//          Icon(Icons.star,color: Colors.orange,size: 20.0,),
//          SizedBox(width: 3.0,),
//        ],
      ),
    );
  }
}
