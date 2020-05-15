import 'package:flutter/material.dart';

Widget mysnackBar (String snacktitle)
{
 return SnackBar (
   content: Text(snacktitle),
   action: SnackBarAction(
     label: 'Undo',
     onPressed: (){},
   ),
 );
//          // it to show a SnackBar.
//          Scaffold.of(context).showSnackBar(snackBar);
}