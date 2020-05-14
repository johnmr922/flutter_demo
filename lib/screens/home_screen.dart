import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
{
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(child: Stack(
        children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              // image: NetworkImage('https://images.unsplash.com/photo-1547665979-bb809517610d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80'),
                image: new AssetImage('assets/png/drawerhead.png'),
                fit: BoxFit.cover
            ) )),

        Text( 'Hello World',textAlign: TextAlign.end,)

        ]
    ));
    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Flutter Learning",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.account_balance, "Bussiness",MenuScreen.routeName),
      getNavItem(Icons.account_balance_wallet, "Education", MenuScreen.routeName),
      getNavItem(Icons.account_box, "Entertainment",MenuScreen.routeName),
      getNavItem(Icons.account_circle, "Finance", MenuScreen.routeName),
      getNavItem(Icons.access_alarm, "Health & fitness", MenuScreen.routeName),
      getNavItem(Icons.account_balance_wallet, "Food & Drink", MenuScreen.routeName),
      getNavItem(Icons.account_box, "Kids",MenuScreen.routeName),
      getNavItem(Icons.account_circle, "LifeStyle", MenuScreen.routeName),
      getNavItem(Icons.access_alarm, "News & Reading", MenuScreen.routeName),
      getNavItem(Icons.account_balance_wallet, "Photo & Video", MenuScreen.routeName),
      getNavItem(Icons.account_box, "Shopping",MenuScreen.routeName),
      getNavItem(Icons.account_circle, "Social", MenuScreen.routeName),
      getNavItem(Icons.access_alarm, "Tools", MenuScreen.routeName),
      aboutChild
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: Center(
            child: Text("Home Screen"),
          )),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
}

class MenuScreen extends StatefulWidget {

  MenuScreen({Key key, this.menutitle}) : super(key: key);
  final String menutitle;
  static const String routeName = "/routname";

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Container(
          child: Center(
            child: Text(widget.menutitle),
          )),
    );
  }
}



