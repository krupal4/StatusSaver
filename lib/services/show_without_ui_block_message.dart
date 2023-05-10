import 'package:fluttertoast/fluttertoast.dart';
import 'package:status_saver/common.dart';


void showMessageWithoutUiBlock({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.greenAccent.shade200,
      textColor: Colors.black,
      fontSize: 16.0
    );
}