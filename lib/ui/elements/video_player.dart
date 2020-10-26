// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class VideoPlayer extends StatefulWidget {
  String _videoId;

  VideoPlayer(String ytUrl) {
    this._videoId = YoutubePlayer.convertUrlToId(ytUrl);
  }

  @override
  _VideoPlayerState createState() => _VideoPlayerState(this._videoId);
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _ytController;

  _VideoPlayerState(String videoId) {
    _ytController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          loop: true
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      key: ObjectKey(_ytController),
      controller: _ytController,
      actionsPadding: const EdgeInsets.only(left: 16.0),
      bottomActions: [
        CurrentPosition(),
        const SizedBox(width: 10.0),
        ProgressBar(isExpanded: true),
        const SizedBox(width: 10.0),
        RemainingDuration(),
        FullScreenButton(),
      ],
    );
  }
}
