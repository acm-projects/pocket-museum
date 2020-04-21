import './models/art.dart';

class Api {

  String url = '';
  Api();

  static Art getImageData(File image) {
    // call api
    final response = await http.get('http://127.0.0.1:9090/'); 
    if (response.statusCode == 200) { 
        return parseArt(response.body); 
    } else { 
        // throw Exception('Unable to fetch art from the REST API'); 
        // * Instead of throwing an exception, return an empty Art object that has "Could not identify art" as the art.name
    } 
    // parse body if type is string (IF IT ALREADY A MAP THEN THERES NO NEED FOR THIS CODE)
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>(); 
    return parsed.map<Art>((json) => Art.fromJson(json)).toList(); 
    // create a new art object with new data
    return Art.fromJson(parsed); // <- pass in api response
  }
}

// Future<List<Art>> fetchArt() async { 
//    final response = await http.get('http://127.0.0.1:9090/'); 
//    if (response.statusCode == 200) { 
//       return parseArt(response.body); 
//    } else { 
//       throw Exception('Unable to fetch art from the REST API'); 
//    } 
// }

// List<Art> parseArt(String responseBody) { 
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>(); 
//    return parsed.map<Art>((json) => Art.fromJson(json)).toList(); 
// } 