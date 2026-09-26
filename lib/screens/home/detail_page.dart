import 'dart:async';

import 'package:clone_spotify_sep_2026/models/music_model_static.dart';
import 'package:clone_spotify_sep_2026/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.musicModelStatic});
  final MusicModelStatic musicModelStatic;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final AudioPlayer _audioPlayer;
  StreamSubscription<bool>? _playingSubscription;
  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();
    unawaited(_loadTrack());
  }

  Future<void> _loadTrack() async {
    await _audioPlayer.setAsset(widget.musicModelStatic.music);

    _playingSubscription = _audioPlayer.playingStream.listen((isPlaying) {
      if (!mounted) return;
      setState(() => _isPlaying = isPlaying);
    });
  }

  /// Change l'etat de lecture de la musique.
  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  @override
  void dispose() {
    _playingSubscription?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset("assets/images/logo-spotify.svg", height: 30),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: widget.musicModelStatic.id,
                  child: Image.asset(
                    widget.musicModelStatic.photo,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.musicModelStatic.artist,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.musicModelStatic.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.heart),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.download_circle),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.ellipsis_vertical),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.add_circled,
                        color: TColors.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: _togglePlayPause,
                      icon: Icon(
                        _isPlaying
                            ? CupertinoIcons.pause_rectangle
                            : CupertinoIcons.play_rectangle,
                        color: TColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ReadMoreText(
                  widget.musicModelStatic.description,
                  trimMode: TrimMode.Line,
                  trimLines: 4,
                  style: Theme.of(context).textTheme.bodySmall,
                  colorClickableText: TColors.primary,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
