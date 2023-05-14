import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/widgets/status_actions.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String videoPath;
  const VideoView({super.key, required this.videoPath});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final ChewieController? _chewieController; 

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.file(File(widget.videoPath)),
      autoInitialize: true,
      autoPlay: true,
      // looping: true,
      showControls: false,
      aspectRatio: 9/16,
      errorBuilder: (_, errorMessage) {
        return Text(errorMessage);
      }
    );
  }

  @override
  void dispose() {
    _chewieController!.pause();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: TextButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
          onPressed: () => pop(context),
          ),),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Chewie(
            controller: _chewieController!,
          ),
          Positioned(
            bottom: 33,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.2,
            child: StatusActions(statusPath: widget.videoPath,)
          ),
        ]
      )
    );
  }
}