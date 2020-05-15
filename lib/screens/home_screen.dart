import 'package:flutter/material.dart';
import 'package:flutterdemo/tabs/first_tab.dart';
import 'package:flutterdemo/tabs/four_tab.dart';
import 'package:flutterdemo/tabs/second_tab.dart';
import 'package:flutterdemo/tabs/third_tab.dart';
import 'package:flutterdemo/util/custom_snackbar.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{

  //Create a Drawer Setup
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

  // Create a tab controller
  TabController controller;
  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          text: 'Tab 1',
          icon: Icon(Icons.favorite),
        ),
        Tab(
          text: 'Tab 2',
          icon: Icon(Icons.adb),
        ),
        Tab(
          text: 'Tab 3',
          icon: Icon(Icons.airport_shuttle),
        ),
        Tab(
          text: 'Tab 4',
          icon: Icon(Icons.account_circle),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
           IconButton(icon: Icon(Icons.camera_alt),
           onPressed:() {
             Scaffold.of(context).showSnackBar(mysnackBar('Camera'));
           }),
            IconButton(icon: Icon(Icons.save),
                onPressed:() {
                  Scaffold.of(context).showSnackBar(mysnackBar('Save'));
                }),
            IconButton(icon: Icon(Icons.access_alarms),
                onPressed:() {
                  Scaffold.of(context).showSnackBar(mysnackBar('Alarm'));
                }),
            IconButton(icon: Icon(Icons.language),
                onPressed:() {
                  Scaffold.of(context).showSnackBar(mysnackBar('Language'));
                }),
        ],
          backgroundColor: Colors.blueAccent,
          // Set the bottom property of the Appbar to include a Tab Bar
          bottom: getTabBar(),

        ),

        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(<Widget>[firstTab(), secondTab(), thirdTab(),fourTab()]),

      drawer: getNavDrawer(context),

      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.deepPurple,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.cake),
            ),
            Tab(
              icon: Icon(Icons.insert_emoticon),
            ),
            Tab(
              icon: Icon(Icons.bluetooth),
            ),
            Tab(
              icon: Icon(Icons.wifi),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
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



