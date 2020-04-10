import 'package:flutter/material.dart';

class Informatio extends StatelessWidget {
  String beta;
  Informatio({this.beta});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.grey[500],
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        shape:BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                    beta,
                    style: TextStyle(
                      fontSize: 20,
                    )
                    ),
                    SizedBox(height: 40),


                  ],
                ),
              ),
            ),

      ),
    );
  }
}

