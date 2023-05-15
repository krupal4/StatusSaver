import 'package:fluttertoast/fluttertoast.dart';
import 'package:status_saver/common.dart';


void showMessageWithoutUiBlock({required String message,Toast toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.greenAccent.shade200,
      textColor: Colors.black,
      fontSize: 16.0
    );
}