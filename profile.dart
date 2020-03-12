//import 'dart:js';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


List _reg01=[false,false,false,false,false,false,false,false,false];
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(/*title: 'Flutter Demo Home Page'*/),
    );
  }
}

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
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _fetch = 0;
  String _roll='',_name='',_desig='',_blah='';
  var imageUrl;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      /*SharedPreferences prefs = await SharedPreferences.getInstance();
      int counter = (prefs.getInt('counter') ?? 0) + 1;
      print('Pressed $counter times.');
      await prefs.setInt('counter', counter);*/
      _counter++;
      final StorageReference storageReference = FirebaseStorage().ref().child('profile.png');
      imageUrl = storageReference.getDownloadURL();
      Firestore.instance
          .collection('users')
          .document('<roll>')
          .get()
          .then((DocumentSnapshot ds) {
        _reg01 = ds['reg01'];
        _roll = ds['roll'];
        _name = ds['name'];
        _desig = ds['desig'];
        _blah = ds['blah'];

        // use ds as a snapshot
      });
      _fetch = _reg01.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      /*appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      drawer: Drawer(
        elevation: 20,
        child:
        Column(
          children: <Widget>[
            ListTile(title: Text("Pages"),),
            ListTile(title: Text("Teams <discard>"),),
            ListTile(title: Text("Sponsors <discard>"),),
            ListTile(title: Text("Guests"),),
            ListTile(title: Text("Team2"),)
          ],
        ),
      ),

      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blueGrey,
              expandedHeight: size.height/2.5,
              floating: false,
              pinned: true,
              //title: Image.asset('assets/images/profile2.png'),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                          Image.asset('assets/images/disney2.jfif',cacheHeight: (size.height/2.5).toInt(),cacheWidth: size.width.toInt(),),
                          //Container(height: 30,color: Colors.blueGrey,),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(top: size.height/2.5 - 50),
                          alignment: Alignment.center,
                          height: 100,
                          //color: Colors.purpleAccent,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orangeAccent,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/profile2.png',
                              fit: BoxFit.contain,
                            ),
                          )

                        //Image.asset('assets/images/profile2.png',height: 100,alignment: Alignment.bottomCenter,)
                      )
                    ],
                  )),
            ),
          ];
        },
        body: SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child:Stack(
              children: <Widget>[
                Container(height: size.height,color: Colors.blueGrey,),
                Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Invoke "debug painting" (press "p" in the console, choose the
                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  // to see the wireframe for each widget.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          Text(
            '$_fetch',
          ),*/
                    /*SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('SliverTest'),
                background: Image.asset('assets/images/galaxy.jfif'),
              ),
            ),*/
                    /*Stack(
                children: <Widget>[
                  Card(
                      color: Colors.white,
                      child:
                      Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 280.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/disney.jfif',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  /*Container(
                                    alignment: Alignment.bottomCenter,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/logo.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )*/

                                ],
                              ),
                            ),
                          ]
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 220),
                    alignment: Alignment.bottomCenter,
                    height: 100,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/profile2.png',
                        fit: BoxFit.contain,
                      ),

                      /*Image.network(imageUrl.toString(),
                        fit: BoxFit.contain,)*/
                    ),
                  )

                ],
              ),*/
                    /*Center(
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/images/scroll.jfif'),
                  Padding(
                    padding: EdgeInsets.only(top: 65,left: 30),
                    child:
                    Text(
                      '$_name',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                ],
              ),
            ),*/


                    Text(
                      '$_name',
                      style: Theme.of(context).textTheme.headline,
                    ),
                    SizedBox(height: 10,),
                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30),
                      color: Colors.indigo[200],
                      elevation: 2,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('$_name'),
                              Text('$_roll'),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('$_desig'),
                              Text('$_blah'),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    /*Center(
              child:
              Container(
                height: 50,
                child:
                GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.horizontal,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 200,
                  shrinkWrap: true,
                  children: <Widget>[
                    Text('$_name'),
                    Text('$_roll'),
                    Text('$_desig'),
                    Text('$_blah'),
                  ],
                ),
              ),
            ),*/
                    SizedBox(height: 10,),
                    RaisedButton(
                      onPressed: _incrementCounter,
                      child: Text('Edit'),
                    ),
                    //Text('\nYou have registered for:\n'),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child:                 ExpansionTile(
                        title: Text("Registered Events",style: TextStyle(color: Colors.black),),
                        children: <Widget>[

                          Card(
                              color: Colors.blueGrey,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      color: Colors.deepOrange,
                                      height: 40,
                                      child: ClipRect(
                                        child: Banner(
                                          message: "Day1",
                                          location: BannerLocation.topEnd,
                                          color: Colors.red,
                                          child: Container(
                                            color: Colors.indigo[200],
                                            height: 10,
                                            child: Center(
                                              child: Text("Narnia"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                      spacing: 8.0,
                                      runSpacing: 4.0,
                                      direction: Axis.horizontal,
                                      children: <Widget>[
                                        for(var i in _reg01) Visibility(
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            onPressed: _incrementCounter,
                                            backgroundColor: Colors.orangeAccent,
                                            child: Icon(Icons.book),
                                          ),
                                          visible: i,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            tooltip: "Register for other events",
                                            heroTag: null,
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                              )
                          ),

                          SizedBox(height: 20,),
                          Card(
                              color: Colors.blueGrey,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      color: Colors.deepOrange,
                                      height: 40,
                                      child: ClipRect(
                                        child: Banner(
                                          message: "Day2",
                                          location: BannerLocation.topEnd,
                                          color: Colors.red,
                                          child: Container(
                                            color: Colors.indigo[200],
                                            height: 10,
                                            child: Center(
                                              child: Text("Abra-Cadabra!"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                      spacing: 8.0,
                                      runSpacing: 4.0,
                                      direction: Axis.horizontal,
                                      children: <Widget>[
                                        for(var i in _reg01) Visibility(
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            onPressed: _incrementCounter,
                                            backgroundColor: Colors.purpleAccent,
                                            child: Icon(Icons.announcement),
                                          ),
                                          visible: i,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            tooltip: "Register for other events",
                                            heroTag: null,
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                              )
                          ),
                          /*Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                //margin: const EdgeInsets.all(10.0),
                                color: Colors.yellow,
                                height: 40,
                                child: ClipRect(
                                  child: Banner(
                                    message: "Day2",
                                    location: BannerLocation.topEnd,
                                    color: Colors.red,
                                    child: Container(
                                      color: Colors.deepPurpleAccent,
                                      height: 10,
                                      child: Center(
                                        child: Text("Hello, banner!"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Wrap(
                                spacing: 8.0,
                                runSpacing: 4.0,
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  for(var i in _reg01) Visibility(
                                    child: FloatingActionButton(
                                      heroTag: null,
                                      onPressed: _incrementCounter,
                                      child:  Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: new BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: FittedBox(
                                          child: Image.asset('assets/images/logo.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                      ,
                                    ),
                                    visible: i,
                                  ),
                                  FloatingActionButton(
                                    heroTag: null,
                                    child: Icon(Icons.add),
                                  ),
                                ]
                            ),
                          ],
                        )
                    ),*/
                          Card(
                              color: Colors.blueGrey,
                              child: Column(
                                children: <Widget>[
                                  Center(
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      color: Colors.yellow,
                                      height: 40,
                                      child: ClipRect(
                                        child: Banner(
                                          message: "Day3",
                                          location: BannerLocation.topEnd,
                                          color: Colors.red,
                                          child: Container(
                                            color: Colors.indigo[200],
                                            height: 10,
                                            child: Center(
                                              child: Text("Apocalypse"),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Wrap(
                                      spacing: 8.0,
                                      runSpacing: 4.0,
                                      direction: Axis.horizontal,
                                      children: <Widget>[
                                        for(var i in _reg01) Visibility(
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            onPressed: _incrementCounter,
                                            backgroundColor: Colors.lime,
                                            child: Icon(Icons.book),
                                          ),
                                          visible: i,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: FloatingActionButton(
                                            tooltip: "Register for other events",
                                            heroTag: null,
                                            child: Icon(Icons.add),
                                          ),
                                        ),
                                      ]
                                  ),
                                ],
                              )
                          ),


                        ],
                      ),
                    ),



                    /*ExpansionTile(
              title: Text('Your Posts'),
              children: <Widget>[
                Text(
                    '\nPosts so far...\n'
                ),

                Card(
                  child: Image.asset('assets/images/Untitled.png'),
                ),
              ],
            ),*/

                    Text(
                        '\nYour posts so far...\n'
                    ),

                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                      child: Image.asset('assets/images/Untitled.png'),
                    ),
                    //Container(height: 10, color: Colors.blueGrey),
                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                      child: Image.asset('assets/images/up1.jpg'),
                    ),
                    //Container(height: 10, color: Colors.blueGrey),


                    /*RaisedButton(
                  child: Text('Teams'),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Team()));
                  },
                ),
                Image.network(imageUrl.toString()),
                RaisedButton(
                  child: Text('Sponsors'),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Sponsors()));
                  },
                ),
                RaisedButton(
                  child: Text('Guests'),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Guests()));
                  },
                ),*/

                  ],
                )

              ],
            )
        ),
        /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
