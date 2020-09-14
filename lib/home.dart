import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_covid/griddashboard.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hexcolor/hexcolor.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#101935'),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 110,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Covid_19",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Hexcolor('#F2FDFF'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Stay safe",
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Hexcolor('#DBCBD8'),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GridDashboard()
            ],
          ),

        ],

      ),

    );
  }
}