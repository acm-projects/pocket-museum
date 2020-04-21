import 'package:flutter/material.dart';

class BottomContent extends StatelessWidget {
  BottomContent({@required this.description, this.font});

  final String description;
  final String font;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(40.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(
              description,
              style: TextStyle(
                fontFamily: font,
                fontSize: 18.0,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(58, 66, 86, 1.0),
                child: Text(
                  "Go Back",
                  style: TextStyle(
                    fontFamily: font,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}