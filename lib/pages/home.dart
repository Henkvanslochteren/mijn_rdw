import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mijn_rdw/pages/settings.dart';
import 'package:mijn_rdw/pages/details.dart';
import 'package:firebase_database/firebase_database.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final auth = FirebaseAuth.instance;
  final googleSignIn = new GoogleSignIn();
  final reference = FirebaseDatabase.instance.reference();


  Drawer getNavDrawer(BuildContext context) {
    var headerChild = new DrawerHeader(
        child: new Text("Mijn RDW"),
    );
    var aboutChild = new AboutListTile(
        child: new Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: new Icon(Icons.adb),
        icon: new Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return new ListTile(
        leading: new Icon(icon),
        title: new Text(s),
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
      getNavItem(Icons.star, "Mijn Voertuigen", "/"),
      getNavItem(Icons.remove_red_eye, "Onlangs bekeken", "/"),
      getNavItem(Icons.show_chart, "Afgegeven kentekens", "/"),
      getNavItem(Icons.add_alert, "Rijbewijs alert", "/"),
      getNavItem(Icons.settings, "Instellingen", SettingsScreen.routeName),
      getNavItem(Icons.star, "App beoordelen", "/"),
      aboutChild
    ];

    ListView listView = new ListView(children: myNavChildren);

    return new Drawer(
      child: listView,
    );
  }


  void logIn() {
    Future<Null> _ensureLoggedIn() async {
      GoogleSignInAccount user = googleSignIn.currentUser;
      if (user == null)
        user = await googleSignIn.signInSilently();
      if (user == null) {
        await googleSignIn.signIn();
        setState(() {});
      }
      if (await auth.currentUser() == null) {
        GoogleSignInAuthentication credentials =
        await googleSignIn.currentUser.authentication;
        await auth.signInWithGoogle(
          idToken: credentials.idToken,
          accessToken: credentials.accessToken,
        );
      }
    }
    setState(() {
      _ensureLoggedIn();
    });
  }


  @override
  Widget build(BuildContext context) {
    logIn();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      drawer: getNavDrawer(context),
      body:
        new ListView(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            new GestureDetector(
              child: new Card(
                child:new Container(
                  child: new Row(
                    children: <Widget>[
                      new Icon(Icons.directions_car,size: 50.0,),
                      new Padding(padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        children: <Widget>[
                          new Text('CITROEN SAXO',),
                          new Text('19-LG-RG')
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),),

                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  margin: const EdgeInsets.all(10.0),
                  height: 80.0,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed(DetailsScreen.routeName);});
              },
            )],
        ),
        floatingActionButton: new FloatingActionButton(
           onPressed: _addKenteken(),
            tooltip: 'Increment',
            child: new Icon(Icons.add),
       )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _addKenteken(){

  }

}