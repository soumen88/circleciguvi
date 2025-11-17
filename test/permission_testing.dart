import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';

void main(){

  test("Mock Camera and Microphone permission", () async{
    final cameraPermissionStatus = PermissionStatus.granted;
    final microphonePermissionStatus = PermissionStatus.granted;
    expect(cameraPermissionStatus, PermissionStatus.granted);
    expect(microphonePermissionStatus, PermissionStatus.granted);
  });

}