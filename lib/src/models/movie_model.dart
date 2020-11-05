class MovieModel {
  String id;
  String url;
  String title;

  MovieModel(this.id, this.url, this.title);



//Shorter syntax
  MovieModel.fromJsonSS(Map<String, dynamic> jsonObj)
   : id = jsonObj['imdbID'],
    url = jsonObj['Poster'],
    title = jsonObj['Title'];
  
}