import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:status_saver/src/common/helpers/statuses_helper.dart';
import 'package:status_saver/src/statuses/views/status_actions.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String videoPath;
  const VideoView({
    super.key,
    required this.videoPath,
  });

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController:
            VideoPlayerController.file(File(widget.videoPath)),
        autoInitialize: true,
        autoPlay: true,
        showOptions: false,
        errorBuilder: (_, errorMessage) {
          return Text(errorMessage);
        });
  }

  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          if (isItSavedStatus(widget.videoPath))
            DeleteSavedStatusAction(
              statusPath: widget.videoPath,
              onPressed: (deleteStatus) async {
                bool wasVideoPlaying = _chewieController?.isPlaying ?? false;
                if (wasVideoPlaying) {
                  _chewieController?.pause();
                }
                await deleteStatus();
                if (wasVideoPlaying) {
                  _chewieController?.play();
                }
              },
            ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: widget.videoPath,
            child: Chewie(
              controller: _chewieController!,
            ),
          ),
          Positioned(
            bottom: 33,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.2,
            child: StatusActions(
              statusPath: widget.videoPath,
              pauseVideoStatus: () async {
                await _chewieController.pause();
              },
            ),
          ),
        ],
      ),
    );
  }
}
