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

class Team extends StatelessWidget {
  int numOfMem = 6;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Team Section"),
      ),*/

      body:
      NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.indigoAccent,
              expandedHeight: 270.0,
              floating: false,
              pinned: true,
              //title: Image.asset('assets/images/profile2.png'),
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/group.jfif',cacheHeight: 720,cacheWidth: 1100,),
                      Container(
                          margin: const EdgeInsets.only(top: 220),
                          alignment: Alignment.bottomCenter,
                          height: 100,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/web.png',
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
          child: Center(
              child: Column(
                children: <Widget>[
                  /*Stack(
                      children: <Widget>[
                      Card(
                      color: Colors.white,
                      child:
                        Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 180.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/group.jfif',
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
                        margin: const EdgeInsets.only(top: 120),
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/web2.png',
                            fit: BoxFit.contain,
                          ),

                  /*Image.network(imageUrl.toString(),
                                fit: BoxFit.contain,)*/
                ),
              )

              ],
            ),*/
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'This is the description of the respective team with the above pic and following members.',
                    ),
                  ),
                  Container(
                    height: size.height-150,
                    child:
                    GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      shrinkWrap: true,
                      children: <Widget>[
                        for(int x=0;x < numOfMem; x++) Visibility(
                          child: FlipCard(
                            direction: FlipDirection.HORIZONTAL, // default
                            front: Container(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/images/book.jfif',height: 150),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(minWidth: double.infinity),
                                    child: RaisedButton(child: Text('Name')),
                                  ),
                                ],
                              ),
                            ),
                            back: Container(
                              child: Center(
                                child: Text('Some Info'),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              )
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
      ),
    );
  }
}
