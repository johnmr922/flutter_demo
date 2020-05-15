import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class fourTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: MyGetHttpData());
  }
}

// Create a stateful widget
class MyGetHttpData extends StatefulWidget {
  @override
  MyGetHttpDataState createState() => MyGetHttpDataState();
}

// Create the state for our stateful widget
class MyGetHttpDataState extends State<MyGetHttpData> {
  final String url = "https://api.themoviedb.org/3/movie/popular?api_key=ec9af24f289764814477679301a30e7c&language=en-US&page=1";
  List data;

  // Function to get the JSON data
  Future<String> getJSONData() async {
    var response = await http.get(
      // Encode the url
        Uri.encodeFull(url),
        // Only accept JSON response
        headers: {"Accept": "application/json"});

    // Logs the response body to the console
    print(response.body);

    // To modify the state of the app, use this method
    setState(() {
      // Get the JSON data
      var dataConvertedToJSON = json.decode(response.body);
      // Extract the required part and assign it to the global variable named data
      data = dataConvertedToJSON['results'];
    });

    return "Successfull";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Center(
                  child: Column(
                    // Stretch the cards in horizontal axis
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: Image.network('https://image.tmdb.org/t/p/w500'+data[index]['poster_path'],fit: BoxFit.fill,),
                          // added padding
                          padding: const EdgeInsets.all(15.0),
                        ),
                      )
                    ],
                  )),
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call the getJSONData() method when the app initializes
    this.getJSONData();
  }
}