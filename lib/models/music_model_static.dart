class MusicModelStatic {
  int id;
  String title;
  String artist;
  String description;
  String photo;
  String music;
  MusicModelStatic({
    required this.id,
    required this.title,
    required this.artist,
    required this.description,
    required this.photo,
    required this.music,
  });

  /// Cree une instance depuis une map JSON.
  factory MusicModelStatic.fromJson(Map<String, dynamic> json) =>
      MusicModelStatic(
        id: json["id"],
        title: json["title"],
        artist: json["artist"],
        description: json["description"],
        photo: json["photo"],
        music: json["music"],
      );

  /// Transforme l'objet en map JSON.
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "artist": artist,
    "description": description,
    "photo": photo,
    "music": music,
  };
}





/// Liste statique principale affichee sur l'accueil.
List<MusicModelStatic> musicList = [
  MusicModelStatic(
    id: 1,
    title: "Title 1",
    artist: "Artist 1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image1.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 2,
    title: "Title 2",
    artist: "Artist 2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image2.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 3,
    title: "Title 3",
    artist: "Artist 3",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image3.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 4,
    title: "Title 4",
    artist: "Artist 4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image4.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 5,
    title: "Title 5",
    artist: "Artist 5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image5.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 6,
    title: "Title 6",
    artist: "Artist 6",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image6.jpeg",
    music: "assets/musics/adele.mp3",
  ),
];

/// Deuxieme bloc de donnees statiques pour enrichir l'accueil.
List<MusicModelStatic> musicList2 = [
  MusicModelStatic(
    id: 13,
    title: "Title 1",
    artist: "Artist 1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image3.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 23,
    title: "Title 2",
    artist: "Artist 2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image2.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 33,
    title: "Title 3",
    artist: "Artist 3",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image1.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 43,
    title: "Title 4",
    artist: "Artist 4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image4.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 53,
    title: "Title 5",
    artist: "Artist 5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image5.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 63,
    title: "Title 6",
    artist: "Artist 6",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image6.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 13,
    title: "Title 1",
    artist: "Artist 1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image3.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 23,
    title: "Title 2",
    artist: "Artist 2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image2.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 33,
    title: "Title 3",
    artist: "Artist 3",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image1.jpeg",
    music: "assets/musics/adele.mp3",
  ),
];

/// Liste des musiques mises en avant dans la section "Trending".
List<MusicModelStatic> trendingList = [
  MusicModelStatic(
    id: 12,
    title: "Title 1",
    artist: "Artist 1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image4.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 22,
    title: "Title 2",
    artist: "Artist 2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image5.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 32,
    title: "Title 3",
    artist: "Artist 3",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image6.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 42,
    title: "Title 4",
    artist: "Artist 4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image3.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 52,
    title: "Title 5",
    artist: "Artist 5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image2.jpeg",
    music: "assets/musics/adele.mp3",
  ),
  MusicModelStatic(
    id: 62,
    title: "Title 6",
    artist: "Artist 6",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    photo: "assets/images/album_image1.jpeg",
    music: "assets/musics/adele.mp3",
  ),
];

