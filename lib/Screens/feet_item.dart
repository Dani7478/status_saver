import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

import '../Common Widget/color_const.dart';

class FeedItem extends StatefulWidget {
  //Url to play video
  final String url;

  const FeedItem({Key? key, required this.url}) : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  //player controller
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    //initialize player
    initializePlayer(widget.url);
  }

//Initialize Video Player
  void initializePlayer(String url) async {
    _controller = VideoPlayerController.network(url);
    _controller!.initialize().then((value) {
      // cachedForUrl(url);
      setState(() {
        _controller!.play();
      });
    });
  }

// //: check for cache
//   Future<FileInfo?> checkCacheFor(String url) async {
//     final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
//     return value;
//   }

//:cached Url Data
//   void cachedForUrl(String url) async {
//     await DefaultCacheManager().getSingleFile(url).then((value) {
//       print('downloaded successfully done for $url');
//     });
//   }

//:Dispose
  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_controller == null)
        ? const Center(
            child: const CircularProgressIndicator(
            color: primaryColor,
          ))
        : ((_controller!.value.isInitialized)
            ? Stack(
                children: [
                  InkWell(
                      onTap: () {
                        if (_controller!.value.isPlaying) {
                          _controller!.pause();
                        } else {
                          _controller!.play();
                        }
                        setState(() {});
                      },
                      child: VideoPlayer(_controller!)),
                  Positioned(
                      bottom: 20,
                      left: 10,
                      child: Icon(
                        _controller!.value.isPlaying ?  Icons.pause : Icons.play_arrow,
                        color: primaryColor,
                        size: 30,
                      ))
                ],
              )
            : Center(
                child: const CircularProgressIndicator(
                color: primaryColor,
              )));
  }
}
