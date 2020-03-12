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

class Guests extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<TimelineModel> items = [
      TimelineModel(Card(child: Image.asset('assets/images/up1.jpg'),),
          position: TimelineItemPosition.random,
          iconBackground: Colors.yellow[200],
          icon: Icon(Icons.today)),
      TimelineModel(Card(child: Image.asset('assets/images/Anirudh_sign.jpg'),),
          position: TimelineItemPosition.random,
          iconBackground: Colors.yellow[200],
          icon: Icon(Icons.assignment_ind)),
      TimelineModel(Card(child: Image.asset('assets/images/up1.jpg'),),
          position: TimelineItemPosition.random,
          iconBackground: Colors.yellow[200],
          icon: Icon(Icons.accessibility_new)),
      TimelineModel(Card(child: Image.asset('assets/images/Anirudh_sign.jpg'),),
          position: TimelineItemPosition.random,
          iconBackground: Colors.yellow[200],
          icon: Icon(Icons.assessment)),
      TimelineModel(Card(child: Image.asset('assets/images/up1.jpg'),),
          position: TimelineItemPosition.random,
          iconBackground: Colors.yellow[200],
          icon: Icon(Icons.audiotrack)),
    ];
    // TODO: implement build
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Guests"),
      ),*/


      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.orangeAccent[100],
              expandedHeight: size.height/2.5,
              floating: false,
              pinned: true,
              //title: Image.asset('assets/images/profile2.png'),
              title: Text("Guests"),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[

                          Image.asset('assets/images/scrollH.jfif',cacheHeight: (size.height/2.5).toInt(),cacheWidth: size.width.toInt(),),
                          //Container(height: 30,color: Colors.blueGrey,),
                        ],
                      ),
                      /*Container(
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
                      )*/
                    ],
                  )),
            ),
          ];
        },
        //  body:

        body: Stack(
          children: <Widget>[
            Container(color: Colors.orangeAccent[100],),
            Padding(child: Text("Have a look to who's gonna visit us!!",textAlign: TextAlign.center,style: Theme.of(context).textTheme.subtitle,),padding: EdgeInsets.only(left: 40),),
            ListView(
              children: <Widget>[
                //Image.asset('assets/images/scrollH.jfif'),
                Timeline(
                  shrinkWrap: true,
                  lineWidth: 1.25,
                  position: TimelinePosition.Left,
                  children: items,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          heroTag: null,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
      ),
    );
  }
}