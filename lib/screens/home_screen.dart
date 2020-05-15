import 'package:flutter/material.dart';
import 'package:flutterdemo/tabs/first_tab.dart';
import 'package:flutterdemo/tabs/four_tab.dart';
import 'package:flutterdemo/tabs/second_tab.dart';
import 'package:flutterdemo/tabs/third_tab.dart';
import 'package:flutterdemo/util/constants.dart';
import 'package:flutterdemo/util/custom_snackbar.dart';
import 'package:flutterdemo/util/util_dark.dart';

import 'back_drop.dart';


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
                image: new AssetImage('assets/png/drawerhead.png'),
                fit: BoxFit.cover
            ) )),

        Text( 'Hello World',textAlign: TextAlign.end,)

        ]
    ));


    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName:  'Flutter Demo',
        applicationVersion:  'version 1.0',
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),

        onTap: () {
          if(routeName==rn_backdrop) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BackDropPage()),
            );
          }else{
            setState(() {
              // pop closes the drawer
              Navigator.of(context).pop();
              // navigate to the route
              Navigator.of(context).pushNamed(routeName);
            });
          }
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.account_balance, "Back Drop Screen Tutorial",rn_backdrop),
      getNavItem(Icons.account_balance_wallet, "Education", rn_default),
      getNavItem(Icons.account_box, "Entertainment",rn_default),
      getNavItem(Icons.account_circle, "Finance",rn_default),
      getNavItem(Icons.access_alarm, "Health & fitness", rn_default),
      getNavItem(Icons.account_balance_wallet, "Food & Drink", rn_default),
      getNavItem(Icons.account_box, "Kids",rn_default),
      getNavItem(Icons.account_circle, "LifeStyle", rn_default),
      getNavItem(Icons.access_alarm, "News & Reading", rn_default),
      getNavItem(Icons.account_balance_wallet, "Photo & Video", rn_default),
      getNavItem(Icons.account_box, "Shopping",rn_default),
      getNavItem(Icons.account_circle, "Social",rn_default),
      getNavItem(Icons.access_alarm, "Tools", rn_default),
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
          body: new SafeArea(
           child:Container(
            // Center the content
              child: Center(
                // Add Text
                child:  getTabBarView(<Widget>[firstTab(), secondTab(), thirdTab(),fourTab()]),
              ),
              // Set background
              decoration: BoxDecoration(
                // Add Gradient
                  gradient: getCustomGradient()))),

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




