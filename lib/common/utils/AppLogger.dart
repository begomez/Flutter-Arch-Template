/*
 * Custom logger used to centralize messages
 */
abstract class AppLogger {
  static final LOG_INFO = true;
  static const String TAG = "AppLogger";

  static void i({String tag = TAG, String msg = ""}) {
    if (LOG_INFO) print("$tag $msg");
  }

  static void e({String tag = TAG, String msg = "", Exception error}) {
    print("$tag $msg");
    if (error != null) {
      print(error.toString());
    }
  }
}
