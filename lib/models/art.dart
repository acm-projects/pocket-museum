
class Art {
  final String artist;
  final String title;
  final String summary;
  final String date;
  final String medium;
  final String imageurl;
  

  Art({this.artist, this.title, this.summary, this.date, this.medium, this.imageurl});

  factory Art.fromJson(Map<String, dynamic> json) {
    return Art(
      artist: json['artist'],
      title: json['title'],
      summary: json['summary'],
      date: json['date'],
      medium: json['medium'],
      imageurl: json['image']
    );
  }
}