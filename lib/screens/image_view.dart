import 'dart:io';

import 'package:photo_view/photo_view.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/common_widgets.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => pop(context), 
          icon: leadingBackIcon  
        ),
        actions: statusActions(context: context, statusPath: imagePath),
      ),
      body: PhotoView(
        minScale: PhotoViewComputedScale.contained * 0.6,
        maxScale: PhotoViewComputedScale.contained * 2.5,
        imageProvider: FileImage(
          File(imagePath)
        ),
      )
    );
  }
}