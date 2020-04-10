
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  GoogleMapController _controller;
  double sdata=28.6793358;
  double sdata1=77.29843077;

 Marker marker;
 Circle circle;
 static final CameraPosition intialloc = CameraPosition(target: LatLng(28.6793358,77.2983077),
zoom: 5,
 );
  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/car_icon.png");
    return byteData.buffer.asUint8List();
  }
  void checkme(LocationData newLocalData){
    print(newLocalData.longitude);
    if(sdata==newLocalData.latitude&&sdata1==newLocalData.longitude)
    {
      showCupertinoModalPopup(context: context, builder: (BuildContext context){
        return Row(
        children: <Widget>[
          Text('DANGER ZONE'),
          Icon(
            Icons.assignment_late
          ),
          RaisedButton(
            onPressed: ()=>Navigator.canPop(context),
            child: Text('Close'),
          ),
        ],
        );
      });

    }
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: 50,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async
  {
    try
    {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null)
      {
        _locationSubscription.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData)
      {
        if (_controller != null)
        {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 5.00)));
          updateMarkerAndCircle(newLocalData, imageData);

          checkme(newLocalData);
        }
      });

    }
    on PlatformException catch (e)
    {
      if (e.code == 'PERMISSION_DENIED')
      {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 40),
      height: 150,
      child: Column(

            children: <Widget>[
              Container(
                height: 250,
                child: GoogleMap(

                  mapType: MapType.normal,
                  initialCameraPosition: intialloc,
                    markers: Set.of((marker != null) ? [marker] : []),
                    circles: Set.of((circle != null) ? [circle] : []),
                  onMapCreated:(GoogleMapController controller){
                    _controller= controller ;
                  }
                ),
              ),
              Container(

                height:40,
                child: FloatingActionButton(
                    child: Icon(Icons.location_searching),
                    onPressed: () {
                      getCurrentLocation();

                    }),
              ),


            ],

          ),
    );


  }
}
