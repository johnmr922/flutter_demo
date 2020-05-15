import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class secondTab extends StatelessWidget {
  final MyGridView myGridView = MyGridView();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  myGridView.build(),
    );
  }
}
class MyGridView {
  GestureDetector getStructuredGridCell(name, image) {
    // Wrap the child under GestureDetector to setup a on click action
    return GestureDetector(
      onTap: () {
        print("onTap called.");
      },
      child: Card(
          elevation: 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Expanded(
              child:Image(image: AssetImage('assets/png/' + image),
                fit: BoxFit.fill,
              )),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child:Text(name,   style: TextStyle( fontSize: 15.0, fontFamily: 'Pacifico')
                    )))
            ],
          )),
    );
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: const EdgeInsets.all(2.0),
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      mainAxisSpacing: 0.5,
      crossAxisSpacing: 0.5,
      children: <Widget>[
        getStructuredGridCell("Flutter Logo1", "bbb.png"),
        getStructuredGridCell("Flutter Logo2", "ccc.png"),
        getStructuredGridCell("Flutter Logo3", "ddd.png"),
        getStructuredGridCell("Flutter Logo4",  "eee.png"),
        getStructuredGridCell("Flutter Logo5",  "fff.jpg"),
        getStructuredGridCell("Flutter Logo6",  "ggg.png"),
      ],
    );
  }
}