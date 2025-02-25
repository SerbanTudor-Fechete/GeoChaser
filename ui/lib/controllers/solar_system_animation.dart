import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class PlanetVideo extends StatefulWidget {
  const PlanetVideo({super.key});

  @override 
  State<PlanetVideo> createState() => _PlanetVideoState();
}

class _PlanetVideoState extends State<PlanetVideo> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.asset('assets/planet.mp4');

    try {
      await videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: videoPlayerController.value.aspectRatio,
        autoPlay: true,
        looping: true,
        autoInitialize: true,
        showControls: false,

      );
    } catch (e) {
      throw Exception('Error initializing video player: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Chewie(controller: chewieController!),
      ),
    );
  }
}