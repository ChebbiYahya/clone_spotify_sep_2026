import 'package:clone_spotify_sep_2026/models/music_model_static.dart';
import 'package:flutter/material.dart';

import '../detail_page.dart';

class MusicComponent extends StatelessWidget {
  const MusicComponent({super.key, required this.musicModelStatic});
  final MusicModelStatic musicModelStatic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailPage(musicModelStatic: musicModelStatic),
          ),
        );
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: musicModelStatic.id!,
                child: Image.asset(musicModelStatic.photo, fit: BoxFit.cover),
              ),
            ),
            Text(
              musicModelStatic.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              musicModelStatic.artist,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
