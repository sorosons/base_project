class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}

class Meme {
  String id;
  String name;
  String url;
  int width;
  int height;
  int boxCount;

  Meme(this.id, this.name, this.url, this.width, this.height, this.boxCount);
}

class MemeData {
  List<Meme> memeData;
  MemeData(this.memeData);
}

class MemeObject {
  MemeData memeData;
  MemeObject(this.memeData);
}
