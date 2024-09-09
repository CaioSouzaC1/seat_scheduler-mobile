String formatUrlLocalApiImage(String? image) {
  if (image == null || image == "") {
    return "https://avatarfiles.alphacoders.com/374/374586.png";
  }

  String relativePath = image.replaceFirst('http://0.0.0.0:3333', '');

  return 'http://10.0.2.2:3333$relativePath';
}
