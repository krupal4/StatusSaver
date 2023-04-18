import 'dart:io';

import 'package:photo_view/photo_view.dart';
import 'package:status_saver/common.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
      ),
      body: PhotoView(
        imageProvider: FileImage(
          File(imagePath)
        ),
      )
    );
  }
}