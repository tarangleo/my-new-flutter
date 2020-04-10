import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './info.dart';
import './Maps.dart' as mapp;
import './Appointment.dart' as app;

void main() => runApp(MaterialApp(
    home : Home()
));

class choices{
  String text;
  IconData t;
  choices({this.text, this.t});

}
List<choices> choice=[
choices(text: 'info', t: Icons.event_note ),
choices(text: 'Zone', t: Icons.assignment_late ),
  choices(text: 'Appointment', t: Icons.local_hospital ),

];
List<String> alpha=[
  'hello',
  'hi birokjkiojg',
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Lets fight against cororna',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          bottom: TabBar(
            tabs: choice.map<Widget>((choices choices){
              return  Tab(
                text: choices.text,
                icon: Icon(choices.t),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children:alpha.map((text) => Informatio(beta: text)).toList(),
            ),
             new mapp.Map(),
            new app.Appoinment(),
          ],

        ),


      ),
    );
  }
}


