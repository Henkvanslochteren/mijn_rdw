import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Column(
          children: <Widget>[
            new Text("CITROEN SAXO"),
            new Text("19-GL-RG")
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Card(
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: <Widget>[
                          new Text("Vervaldatum APK"),
                          new Text("26-27-2018", style: new TextStyle(fontWeight: FontWeight.bold))
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                      ,),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
              new Card(
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: <Widget>[
                          new Text("Verbuik"),
                          new Text("1 op 16.4",style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text("(6.1L/100 KM)")
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                      ,),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          ),
          new Row(
            children: <Widget>[
              new Card(
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: <Widget>[
                          new Text("Datum eerste toelating"),
                          new Text("09-01-2001",style: new TextStyle(fontWeight: FontWeight.bold)),
                          new Text("(Bouwjaar)")
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                      ,),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
              new Card(
                  child: new Container(
                    child: new Center(
                      child: new Column(
                        children: <Widget>[
                          new Text("WAM-verzekerd"),
                          new Text("JA",style: new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                      )
                      ,),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          new Divider(height: 16.0,),
          new Container(
            child: new Card(
              child: new Container(
                child: new Center(child:Text("ZELF REGELEN",style: new TextStyle(fontWeight: FontWeight.bold))),
                height: 60.0,
                width: 380.0,
              )
            ),
          ),
          new Row(
            children: <Widget>[
              new Card(
                  child: new Container(
                    child: new Center(child:Text("Schorsing auto aanvragen")),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
              new Card(
                  child: new Container(
                    child: new Center(child:Text("Kentekenbewijs op naam zetten")),
                    height: 120.0,
                    width: 180.0,
                  )
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ],

      ),
    );
  }
}