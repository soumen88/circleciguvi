import 'package:circleciguvi/base/api_repository.dart';
import 'package:circleciguvi/base/app_constants.dart';
import 'package:circleciguvi/base/firebase_utils.dart';
import 'package:circleciguvi/commonwidgets/display_error_widget.dart';
import 'package:circleciguvi/commonwidgets/display_loading_widget.dart';
import 'package:circleciguvi/details/details_screen.dart';
import 'package:circleciguvi/list_demo/page_view_demonstration.dart';
import 'package:circleciguvi/login/login_screen.dart';
import 'package:circleciguvi/mapsscreen/location_utils.dart';
import 'package:circleciguvi/mapsscreen/maps_screen.dart';
import 'package:circleciguvi/timer/timer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget{

  final firebaseUtils = FirebaseUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to flutter"),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen()));
                },
                child: Text("Timer screen")
            ),
            FilledButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text("Start Login Screen")
            ),
            Builder(
                builder: (context) {
                  return FilledButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen()));
                    },
                    label: Text("Start Details Screen"),
                    icon: Icon(Icons.add),
                  );
                }
            ),
            FilledButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewDemonstration()));
                },
                child: Text("Start Pageviews")
            ),
            FilledButton(
                onPressed: () async{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapsScreen()));
                },
                child: Text("Location data")
            ),
            FilledButton(
                onPressed: () async{
                  /*var locationUtils = LocationUtils();
                  await locationUtils.getUserLocation().then((LocationData locationData){
                    print("Location info latitude ${locationData.latitude}, longitude ${locationData.longitude}");
                  }).onError((exception, stackTrace){
                    print("Error occurred $exception with stack trace $stackTrace");
                  });*/
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MapsScreen()));
                },
                child: Text("Testing common widgets")
            ),
            FilledButton(
                onPressed: () async{
                  await firebaseUtils.initializeFirebase().then((User? currentUser) async{
                    if(currentUser == null){
                      await firebaseUtils.startGoogleSignIn();
                    }
                  });
                },
                child: Text("Start Gmail Signin")
            ),
            FilledButton(
                onPressed: () async{
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? nameSaved = prefs.getString(AppConstants.kDisplayName);
                  print("Display Name $nameSaved");
                },
                child: Text("Fetch details")
            ),
            FilledButton(
                onPressed: () async{
                  ApiRepository().hitServerForFetchingProducts();
                },
                child: Text("API Example")
            ),
          ],
        ),
      ),
    );
  }

}