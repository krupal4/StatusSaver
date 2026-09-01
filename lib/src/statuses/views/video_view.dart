import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status_saver/src/common/views/circular_loader.dart';
import 'package:status_saver/src/statuses/views/status_actions.dart';
import 'package:status_saver/src/theme/app_theme.dart';
import 'package:status_saver/src/theme/colors.dart';
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
  late final VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _showChrome = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    await _videoPlayerController.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        showOptions: false,
        allowFullScreen: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppColors.emerald,
          handleColor: AppColors.emerald,
          bufferedColor: Colors.white38,
          backgroundColor: Colors.white24,
        ),
        errorBuilder: (_, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white70),
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _chewieController?.pause();
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _toggleChrome() {
    setState(() => _showChrome = !_showChrome);
  }

  @override
  Widget build(BuildContext context) {
    final ChewieController? controller = _chewieController;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.cinemaOverlay,
      child: Scaffold(
        backgroundColor: AppColors.cinemaBlack,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: controller == null
                  ? const CircularLoader()
                  : GestureDetector(
                      onTap: _toggleChrome,
                      child: Hero(
                        tag: widget.videoPath,
                        child: Chewie(controller: controller),
                      ),
                    ),
            ),
            CinemaTopBar(
              visible: _showChrome,
              statusPath: widget.videoPath,
              onDeletePressed: (deleteStatus) async {
                final bool wasPlaying = _videoPlayerController.value.isPlaying;
                if (wasPlaying) {
                  await _videoPlayerController.pause();
                }
                await deleteStatus();
                if (wasPlaying && mounted) {
                  await _videoPlayerController.play();
                }
              },
            ),
            CinemaActionBar(
              visible: _showChrome,
              statusPath: widget.videoPath,
              extraBottom: 64,
              pauseVideoStatus: () async {
                await _videoPlayerController.pause();
              },
            ),
          ],
        ),
      ),
    );
  }
}
