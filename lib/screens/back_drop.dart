import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';


class BackDropPage extends StatefulWidget {
  @override
  _BackDropPageState createState() => _BackDropPageState();
}

class _BackDropPageState extends State<BackDropPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [Widget1(), Widget2(),Widget3(), Widget4(),Widget5(), Widget6()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Backdrop Demo',
      home: BackdropScaffold(
        title: Text("Backdrop Navigation Example"),
        iconPosition: BackdropIconPosition.leading,
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          ),
        ],
        stickyFrontLayer: true,
        frontLayer: _pages[_currentIndex],
        backLayer: BackdropNavigationBackLayer(
          items: [
            ListTile(title: Text("Home",style: TextStyle(color: Colors.white))),
            ListTile(title: Text("Category",style: TextStyle(color: Colors.white))),
            ListTile(title: Text("Shop",style: TextStyle(color: Colors.white))),
            ListTile(title: Text("Blog",style: TextStyle(color: Colors.white))),
            ListTile(title: Text("Contact Us",style: TextStyle(color: Colors.white))),
            ListTile(title: Text("Sign In",style: TextStyle(color: Colors.white))),
          ],
          onTap: (int position) => {setState(() => _currentIndex = position)},
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home", style: TextStyle(color: Colors.red)));
  }
}
class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Category", style: TextStyle(color: Colors.red)));
  }
}
class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Shop"));
  }
}
class Widget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Blog"));
  }
}
class Widget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Contact US"));
  }
}
class Widget6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Sign IN"));
  }
}