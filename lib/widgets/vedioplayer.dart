import 'dart:ffi';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Vedio extends StatefulWidget {
  final VideoPlayerController vedioplayercontroller;
  final bool loop;

  const Vedio({
    Key? key,
    required this.vedioplayercontroller,
    required this.loop,
  }) : super(key: key);

  @override
  State<Vedio> createState() => _VedioState();
}

class _VedioState extends State<Vedio> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.vedioplayercontroller,
      looping: widget.loop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    // Dispose of the ChewieController and VideoPlayerController.
    _chewieController.dispose();
    widget.vedioplayercontroller.dispose();
    super.dispose();
  }
}

class VedioPlayer extends StatefulWidget {
  final String vediodata;

  const VedioPlayer({Key? key, required this.vediodata}) : super(key: key);

  @override
  State<VedioPlayer> createState() => _VedioPlayerState();
}

class _VedioPlayerState extends State<VedioPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.vediodata)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: _videoPlayerController.value.isInitialized
          ? Vedio(
        vedioplayercontroller: _videoPlayerController,
        loop: true,
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the VideoPlayerController.
    _videoPlayerController.dispose();
    super.dispose();
  }
}
 