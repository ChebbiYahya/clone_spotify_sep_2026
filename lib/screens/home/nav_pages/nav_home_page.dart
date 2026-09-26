import 'package:flutter/material.dart';

import '../../../models/music_model_static.dart';
import '../components/music_component.dart';
import '../components/music_trending_compnent.dart';

class NavHomePage extends StatefulWidget {
  const NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Made for you",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.replay_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings_rounded),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: musicList.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: ((context, index) =>
                    MusicComponent(musicModelStatic: musicList[index])),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Trending now",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ListView.builder(
              itemCount: trendingList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              itemBuilder: ((context, index) => MusicTrendingComponent(
                musicModelStatic: trendingList[index],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
