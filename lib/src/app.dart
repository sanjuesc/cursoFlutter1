// import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get; //solamente mostrar get de todo lo que tiene
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

// create a class that will be our custom widget
// this class must extend the "StatlessWidget" base class
class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}


class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter ++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }
    // We must define a build method that return
    // the widgets *this* widget will show
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Let's see some images!")
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: const Icon(Icons.clear),
        ),
        body: ImageList(images),
      ),
    );

  }

}

