import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class Audioscareen extends StatefulWidget {
  const Audioscareen({Key? key}) : super(key: key);

  @override
  State<Audioscareen> createState() => _AudioscareenState();
}

class _AudioscareenState extends State<Audioscareen> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool ispaly = false;
  Icon play = Icon(Icons.play_circle_outline);
  Duration tdu = Duration(seconds: 0);
  Duration cdu = Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Audio("assets/music/song1.mp3"),
      autoStart: false,
      showNotification: true,
    );

    assetsAudioPlayer.current.listen((event) {
      tdu = event!.audio.duration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: () {
              playaudio();
            }, icon: play),
            PlayerBuilder.currentPosition(
                player: assetsAudioPlayer, builder: (context, duration) {
                  return Column(
                    children: [
                      Slider(
                          value: duration.inSeconds.toDouble(),
                        activeColor: Colors.purple,
                        inactiveColor: Colors.pink,
                        max: tdu.inSeconds.toDouble(),
                          onChanged: (value){
                            assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                            print("===$cdu");
                          },),
                      Text("$duration/$tdu"),
                    ],
                  );
            }),
          ],
        ),
      ),
    );
  }
  void playaudio(){
    if(ispaly==false){
      assetsAudioPlayer.play();
      setState(() {
        ispaly=true;
        play=Icon(Icons.pause_circle_outline);
      });
    }
    else{
      assetsAudioPlayer.pause();
      setState(() {
        ispaly=false;
        play=Icon(Icons.play_circle_outline);
      });
    }
  }
}
