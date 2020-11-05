class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> jsonObj){
    id = jsonObj['id'];
    url = jsonObj['url']; 
    title = jsonObj['title'];
  }

//Shorter syntax
  ImageModel.fromJsonSS(Map<String, dynamic> jsonObj)
   : id = jsonObj['id'],
    url = jsonObj['url'], 
    title = jsonObj['title'];
  
}