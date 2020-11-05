import 'movie_model.dart';

class BaseMovieModel {

  List<MovieModel> dataArray;

  BaseMovieModel(this.dataArray);

  BaseMovieModel.fromJson(Map<String, dynamic> jsonObj){
    var list = jsonObj['Search'] as List;
    dataArray = list.map((i)=> MovieModel.fromJsonSS(i)).toList();
  }

}