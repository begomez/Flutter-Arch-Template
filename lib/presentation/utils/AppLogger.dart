abstract class AppLogger {
  static const String TAG = "AppLogger";

  void i({String tag = TAG, String msg = ""}) {
    print("$tag $msg");
  }

  void e({String tag = TAG, String msg = "", Exception error}) {
    print("$tag $msg");
  }
}
