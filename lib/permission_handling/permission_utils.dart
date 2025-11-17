import 'package:permission_handler/permission_handler.dart';

class PermissionUtils{

  Future<void> askCameraAndMicrophonePermission() async{
    var status = await Permission.camera.status;
    if(status.isDenied){
      Map<Permission, PermissionStatus> listOfPermissions = await [
        Permission.camera,
        Permission.microphone
      ].request();
    }

    bool isCameraPermissionGranted = await Permission.camera.status.isGranted;
    bool isMicrophonePermissionGranted = await Permission.microphone.status.isGranted;
    print("Is camera granted $isCameraPermissionGranted");
    print("Is Microphone granted $isMicrophonePermissionGranted");
  }

}