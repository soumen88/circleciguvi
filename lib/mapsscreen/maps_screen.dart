import 'package:circleciguvi/commonwidgets/display_error_widget.dart';
import 'package:circleciguvi/commonwidgets/display_loading_widget.dart';
import 'package:circleciguvi/mapsscreen/display_location_widget.dart';
import 'package:circleciguvi/mapsscreen/location_utils.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class MapsScreen extends StatelessWidget {

  var locationUtils = LocationUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: FutureBuilder(
            future: locationUtils.getUserLocation(),
            builder: (BuildContext context, AsyncSnapshot<LocationData> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return DisplayLoadingWidget();
              }
              else if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError){
                  return DisplayErrorWidget(
                      errorMessage: snapshot.error.toString()
                  );
                }
                else if(snapshot.hasData){
                  LocationData data = snapshot.data!;
                  return DisplayLocationWidget(
                    latitude: data.latitude ?? 0.0,
                    longitude: data.longitude ?? 0.0,
                  );
                }
                else{
                  return DisplayErrorWidget(
                      errorMessage: "Something went wrong"
                  );
                }
              }
              else{
                return DisplayErrorWidget(
                    errorMessage: "Something went wrong"
                );
              }
            }
        )
      ),
    );
  }
}
