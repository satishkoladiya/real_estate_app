class ImageAssets {
  static const room1 = IMG('room1.jpeg', r"LMM7rr_N01V?4:xu%MWBD$IUV@oe");
  static const room2 = IMG('room2.jpeg', r"LPL;$._M4nbY~qxaE1bbM{t7%LV@");
  static const room3 = IMG('room3.jpeg', r"LYPi;i_3IobH_NWBj[WBjYxu%Mt7");
  static const room4 = IMG('room4.jpeg', r"LYPi;i_3IobH_NWBj[WBjYxu%Mt7");
  static const room5 = IMG('room4.jpeg', r"LbMHGS9GIAt7~qRPMyWBofWAt7WA");
}

class IMG {
  final String path;
  final String hash;

  const IMG(String img, this.hash) : path = 'assets/img/$img';
}
