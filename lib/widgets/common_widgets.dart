
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/constants.dart';

const leadingBackIcon = Icon(Icons.arrow_back_ios_new_rounded);

List<Widget> statusActions({required BuildContext context, required String statusPath}) {
  return [
    IconButton(
      onPressed: (){
        if(statusPath.endsWith(JPG)) {
          ImageGallerySaver.saveFile(statusPath)
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: 
            Text(AppLocalizations.of(context)?.statusSavedMessage ?? "Status saved")
            )));
        } else {
          
        }
      }, 
      icon: const Icon(Icons.file_download_rounded)
    ),
    IconButton(
      onPressed: (){
        if(statusPath.endsWith(JPG)) {
          FlutterNativeApi.shareImage(statusPath);
        } else {
        }
      }, 
      icon: const Icon(Icons.share_rounded)
    ),
    const SizedBox(width: 10)    
  ];
}