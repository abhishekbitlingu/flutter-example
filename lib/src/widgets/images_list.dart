import 'package:flutter/material.dart';

import '../models/image_model.dart';
import '../models/movie_model.dart';
import '../homescreen.dart';

import 'package:flutter/animation.dart';

class ImageList extends StatelessWidget {

  final List<ImageModel> oldData = [];
  final List<MovieModel> data;
  final Axis scrollDirection = Axis.vertical;


  ImageList(this.data);




  @override
    Widget build(BuildContext context) {
      // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 70, bottom: 20),
            child: new Text('The Awesome App',
              textAlign: TextAlign.left,
              style: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.bold, fontSize: 20),
            )
          )
          ,
        new Container(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return horizontalItem(index, context);
            },
          ),
        ),

          new Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return buildImage(data[index]);

              },
            ),
          )
      ]
    )
    );

    }

   Widget buildImage(MovieModel dataObj ){
      return Card(
      margin: EdgeInsets.all(16),
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Column(children: <Widget>[
        Image.network('${dataObj.url}', fit: BoxFit.fitWidth)
        ]),
    );
    }

  Widget horizontalItem(int index, BuildContext context){
    return Container(
        child: GestureDetector(
          onTap: (){
            _navigateAndDisplaySelection(context);
          },
          child: Card(
              margin: EdgeInsets.all(16),
              elevation: 8,
              color: Colors.blue,
              clipBehavior: Clip.antiAlias,
              child: Column(children: <Widget>[
                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd-tMkJxL_ZXmhXwcJM_0m3jIwHB1pPFDEPcr_QJ6X6M7d9e8Z4g', fit: BoxFit.fill)
              ])
          ),
        )
    );
  }


  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute(buttonTxt: 'Hey from home screen')),
    );

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result!
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}


