import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/statuses/views/status_actions.dart';

class ImageView extends StatelessWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          if (isItSavedStatus(imagePath))
            DeleteSavedStatusAction(
              statusPath: imagePath,
            )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: imagePath,
            child: PhotoView(
              minScale: PhotoViewComputedScale.contained * 0.6,
              maxScale: PhotoViewComputedScale.contained * 2.5,
              imageProvider: FileImage(File(imagePath)),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.2,
            child: StatusActions(
              statusPath: imagePath,
            ),
          ),
        ],
      ),
    );
  }
}
