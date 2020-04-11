import 'package:flutter/material.dart';
import 'painting_title_text.dart';

class TopImageContainer extends StatelessWidget {
  TopImageContainer({@required this.image, @required this.paintingTitleText});

  final ImageProvider<dynamic> image;
  final PaintingTitleText paintingTitleText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(40.0),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(58, 66, 86, 0.9),
          ),
          child: paintingTitleText,
        ),
        Positioned(
          left: 12.0,
          top: 40.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 36,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}