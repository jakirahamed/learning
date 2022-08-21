import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerTest extends StatefulWidget {
  const PlayerTest({Key? key, this.url}) : super(key: key);
  final url;
  @override
  State<PlayerTest> createState() => _PlayerTestState();
}

class _PlayerTestState extends State<PlayerTest> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.url,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player test'),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// // import 'package:flick_video_player/flick_video_player.dart';
// // import 'package:video_player/video_player.dart';

// class SamplePlayer extends StatefulWidget {
//   const SamplePlayer({Key? key}) : super(key: key);

//   @override
//   _SamplePlayerState createState() => _SamplePlayerState();
// }

// class _SamplePlayerState extends State<SamplePlayer> {
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     flickManager = FlickManager(
//       videoPlayerController:
//           VideoPlayerController.network("apps promo With Music.mp4"),
//     );
//   }

//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FlickVideoPlayer(flickManager: flickManager),
//     );
//   }
// }
