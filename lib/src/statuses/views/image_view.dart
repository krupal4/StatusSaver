import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:status_saver/src/statuses/views/status_actions.dart';
import 'package:status_saver/src/theme/app_theme.dart';
import 'package:status_saver/src/theme/colors.dart';

class ImageView extends StatefulWidget {
  final String imagePath;
  const ImageView({super.key, required this.imagePath});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  bool _showChrome = true;

  void _toggleChrome() {
    setState(() => _showChrome = !_showChrome);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.cinemaOverlay,
      child: Scaffold(
        backgroundColor: AppColors.cinemaBlack,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: PhotoView(
                minScale: PhotoViewComputedScale.contained * 0.6,
                maxScale: PhotoViewComputedScale.contained * 2.5,
                heroAttributes:
                    PhotoViewHeroAttributes(tag: widget.imagePath),
                backgroundDecoration:
                    const BoxDecoration(color: AppColors.cinemaBlack),
                imageProvider: FileImage(File(widget.imagePath)),
                onTapUp: (_, __, ___) => _toggleChrome(),
              ),
            ),
            CinemaTopBar(
              visible: _showChrome,
              statusPath: widget.imagePath,
            ),
            CinemaActionBar(
              visible: _showChrome,
              statusPath: widget.imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
