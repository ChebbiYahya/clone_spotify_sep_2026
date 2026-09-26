import 'package:flutter/material.dart';

import '../../../models/music_model_static.dart';

class MusicTrendingComponent extends StatelessWidget {
  const MusicTrendingComponent({super.key, required this.musicModelStatic});
  final MusicModelStatic musicModelStatic;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: musicModelStatic.id,
              child: Image.asset(musicModelStatic.photo, fit: BoxFit.cover),
            ),
          ),
          Text(
            musicModelStatic.artist,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            musicModelStatic.title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
