import 'dart:developer' as developer;

class LoggerUtils{

  void log(String TAG, String message){
    developer.log(message, name:TAG);

  }

}