import 'package:flutter/material.dart';

class PaintingTitleText extends StatelessWidget {
  PaintingTitleText(
      {@required this.artist,
      @required this.paintingTitle,
      this.timePeriod,
      this.medium,this.font});

  final String artist;
  final String paintingTitle;
  final String timePeriod;
  final String medium;
  final String font;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ImageIcon(
          AssetImage('assets/images/whitemuseum.png'),
          color: Colors.white,
          size: 40.0,
        ),
        SizedBox(
          height: 15.0,
          width: 90.0,
          child: Divider(
            color: Color(0xFFF4B03A),
          ),
        ),
        Text(
          artist,
          style: TextStyle(
            fontFamily: font,
            color: Colors.white,
            fontSize: 25.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          paintingTitle,
          style: TextStyle(
            fontFamily: font,
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        SizedBox(height: 12.0),
        Text(
          timePeriod,
          style: TextStyle(
            fontFamily: font,
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          medium,
          style: TextStyle(
            fontFamily: font,
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      ],
    );
  }
}