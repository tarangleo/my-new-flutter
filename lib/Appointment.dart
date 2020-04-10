import 'package:flutter/material.dart';

class Appoinment extends StatefulWidget {
  @override
  _AppoinmentState createState() => _AppoinmentState();
}

class _AppoinmentState extends State<Appoinment> {
 int tokken=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Icon(
                 Icons.turned_in_not,
                semanticLabel: '10',
                size: 194,
                color: Colors.redAccent,

              ),
            ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                      'CURRENT TOKEN :',
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                        color: Colors.red[400]
                      ),
                  ),
                  SizedBox(height:20),
                  Text(
                    '$tokken',
                    style: TextStyle(
                        fontSize: 40,

                        color: Colors.red
                    ),
                  ),
                ],
              ),
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_drop_up),

                onPressed: (){
                 tokken++;
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: (){
                  tokken--;
                },
              ),
            ],
          ),

          ],
        ),
        SizedBox(height:30),

          Row(
            children: <Widget>[
              Text(
                'REMAINING TIME:      ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber
                ),
              ),
              Text(
                '20:00 mins',
                 style: TextStyle(
                  fontSize: 20,
                   color: Colors.amber
                 ),
              ),

            ],
          ),

        SizedBox(height:210),
        Container(

          color: Colors.blueGrey[900],
          child: Text(
            'Your Token :              50   ',
            style: TextStyle(
              fontSize: 40,
                color: Colors.redAccent
            ),
          ),
        )

      ],
      ),
    );
  }
}
