import 'package:fluttertoast/fluttertoast.dart';
import 'package:status_saver/common.dart';


void showMessageWithoutUiBlock({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.white,
      fontSize: 16.0
    );
}