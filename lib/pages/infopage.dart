import 'package:flutter/material.dart';
import 'package:pocket_museum_final/blocs/painting_title_text.dart';
import 'package:pocket_museum_final/blocs/top_image_container.dart';
import 'package:pocket_museum_final/blocs/bottom_content.dart';

String image;

class InfoPage extends StatelessWidget {
  NetworkImage getImage(){
    image = 'https://i.dailymail.co.uk/1s/2019/01/08/16/5164748-6569643-Da_Vinci_s_most_recognisable_works_include_the_Mona_Lisa_picture-a-74_1546965056841.jpg';
    return NetworkImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: TopImageContainer(
              // gets the image from whatever source is needed
              image: getImage(),
              paintingTitleText: PaintingTitleText(
                artist: 'Leonardo da Vinci' + '\'s',
                paintingTitle: 'Mona Lisa',
                timePeriod: '1503-1506',
                medium: 'Oil on poplar panel',
              ),
            ),
          ),
          Expanded(
            // gives a description based on whatever description is given
            child: BottomContent(
              description:
                  'The Mona Lisa is a half-length portrait painting by the Italian artist Leonardo da Vinci. It is considered an archetypal masterpiece of the Italian Renaissance, and has been described as \"the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world.\" The painting\'s novel qualities include the subject\'s expression, which is frequently described as enigmatic, the monumentality of the composition, the subtle modelling of forms, and the atmospheric illusionism.',
            ),
          ),
        ],
      ),
    );
  }
}