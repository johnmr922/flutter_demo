import 'package:flutter/material.dart';

class secondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.favorite,
              size: 160.0,
              color: Colors.blue,
            ),
            Text("First Tab")
          ],
        ),
      ),
    );
  }
}
