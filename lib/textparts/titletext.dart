import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText(
      {@required this.text,
      @required this.font,
      @required this.icon, @required this.size,
      });
  final String text;
  final String font;
  final Icon icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: icon,
                      ),
                    ),
                    TextSpan(
                      text: text,
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: size,
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}