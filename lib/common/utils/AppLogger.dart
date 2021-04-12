abstract class AppLogger {
  static const String TAG = "AppLogger";

  static void i({String tag = TAG, String msg = ""}) {
    print("$tag $msg");
  }

  static void e({String tag = TAG, String msg = "", Exception error}) {
    print("$tag $msg");
    if (error != null) {
      print(error.toString());
    }
  }
}
