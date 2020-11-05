import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'models/movie_model.dart';
import 'models/base_movie_model.dart';
import 'dart:convert';
import 'widgets/images_list.dart';

class App extends StatefulWidget {

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }
}
 
class AppState extends State<App> {
//  int counter = 0;
//  List<ImageModel> dataArray = [];
  List<MovieModel> movieArray = [];

//  void fetchImage() async {
//      counter++;
//      final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
//      final imageModel = ImageModel.fromJsonSS(json.decode(response.body));
//      print(response.body);
//      setState(() {
//              dataArray.add(imageModel);
//            });
//  }

  void fetchMovies() async {
    final response = await get('http://www.omdbapi.com/?s=all&apikey=4c2adae7');
    final jsonResponse = json.decode(response.body);
    BaseMovieModel model = BaseMovieModel.fromJson(jsonResponse);
    print(response.body);
    setState(() {
      movieArray.addAll(model.dataArray);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies();
  }

 @override
   Widget build(BuildContext context) {
     // TODO: implement build
     return Scaffold(
        body: ImageList(movieArray),
  );
   }

}