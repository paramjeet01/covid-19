import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hexcolor/hexcolor.dart';


class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
      subtitle: "Contact & Helpline Information",
      img: "assets/images/c&h.png",
      val: 'a');

  Items item2 = new Items(
    subtitle: "Government Guidelines ",
    img: "assets/images/gg.png",
    val: 'b',
  );

  Items item3 = new Items(
    subtitle: "Hospital Dashboard",
    img: "assets/images/hsp.png",
    val: 'c',

  );

  Items item4 = new Items(
    subtitle: "Tests and Confirmed cases",
    img: "assets/images/cc.png",
    val: 'd',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4,];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Hexcolor('#DBCBD8'), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,

                  ),
                  SizedBox(
                    height: 14,
                  ),

                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Hexcolor('#101935'),
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),

                  RaisedButton(
                      child: Text(
                          'View',
                          style: TextStyle(
                          color: Hexcolor('#161925'),
                      )
                      ),
                      color: Hexcolor('#F2FDFF'),
                      onPressed: () {

                        switch(data.val) {
                          case "a": {  Navigator.pushNamed( context , '/locations'); }
                          break;

                          case "b": { Navigator.pushNamed( context , '/notification');  }
                          break;

                          case "c": { Navigator.pushNamed( context , '/hospital');  }
                          break;

                          case "d": { Navigator.pushNamed( context , '/graph');  }
                          break;

                        }

                      }
                  )

                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {

  String subtitle;
  String img;
  String val;
  Items({ this.subtitle,  this.img ,this.val});
}