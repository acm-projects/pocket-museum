import 'package:flutter/material.dart';
import 'package:pocket_museum_final/blocs/painting_title_text.dart';
import 'package:pocket_museum_final/blocs/top_image_container.dart';
import 'package:pocket_museum_final/blocs/bottom_content.dart';
import 'package:pocket_museum_final/pages/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
 
Future<Album> fetchAlbum() async {
  final response =
      await http.get('http://127.0.0.1:9090/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String artist;
  final String title;
  final String summary;
  final String date;
  final String medium;
  final String imageurl;
  

  Album({this.artist, this.title, this.summary, this.date, this.medium, this.imageurl});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      artist: json['artist'],
      title: json['title'],
      summary: json['summary'],
      date: json['date'],
      medium: json['medium'],
      imageurl: json['image']
    );
 }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['artist'] = this.artist;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['date'] = this.date;
    data['medium'] = this.medium;
    data['image'] = this.imageurl;
    
    return data;
  }

}


String image;

class InfoPage extends StatelessWidget {
  
  Album album = Album();

  NetworkImage getImage() {
    image =
        album.imageurl;
    return NetworkImage(image);
  }
  
  final String font;

  InfoPage({Key key, @required this.font}) : super(key: key);

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
                artist: album.artist + '\'s',
                paintingTitle: album.title,
                timePeriod: album.date,
                medium: album.medium,
                font: fam,
              ),
            ),
          ),
          Expanded(
            // gives a description based on whatever description is given
            child: BottomContent(
              font: fam,
              description:
                album.summary
            ),
          ),
        ],
      ),
    );
  }
}
