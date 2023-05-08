import 'dart:io';

import 'package:photo_view/photo_view.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/status_actions.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: TextButton(
            child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
            onPressed: () => pop(context),
            ),),
        body: Stack(
          clipBehavior: Clip.none,
          children: [PhotoView(
            minScale: PhotoViewComputedScale.contained * 0.6,
            maxScale: PhotoViewComputedScale.contained * 2.5,
            imageProvider: FileImage(
                File(imagePath)
              ),
            ),
            Positioned(
              bottom: 10,
              width: MediaQuery.of(context).size.width,
              child: StatusActions(statusPath: imagePath,)
            ),
          ]
        )
      ),
    );
  }
}