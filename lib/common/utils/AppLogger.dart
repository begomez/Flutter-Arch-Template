/*
 * Custom logger used to centralize messages
 */
abstract class AppLogger {
  static final logInfo = true;
  static const String TAG = "AppLogger";

  static void i({String tag = TAG, String msg = ""}) {
    if (logInfo) print("$tag $msg");
  }

  static void e({String tag = TAG, String msg = "", Exception? error}) {
    print("$tag $msg");
    if (error != null) {
      print(error.toString());
    }
  }
}
