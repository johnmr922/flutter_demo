import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState()
  {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {}
    }
    );
  }

  Future<bool> _mockCheckForSession() async
  {
    await Future.delayed(Duration(milliseconds: 5000),(){});
    return true;
  }

  void _navigateToHome()
  {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(BuildContext context) => HomeScreen(title: 'Flutter')
    ));
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

              Opacity(
             opacity: 0.5,
               child : Container(
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                        // image: NetworkImage('https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                         image: new AssetImage('assets/png/bg.jpg'),
                         fit: BoxFit.cover
                     ) ))),

          Shimmer.fromColors(
          baseColor: Colors.white,
          highlightColor: Colors.blue,
          child: Container(
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.bottomCenter,
            child: Text( 'MingalarTech',
            style: TextStyle( fontSize: 35.0, fontFamily: 'Pacifico',
                shadows: <Shadow>[
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black38,
                  offset: Offset.fromDirection(120,12)
                )]),),),),],),
      ),
    );
  }
}


