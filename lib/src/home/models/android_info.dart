class AndroidInfo {
  final int androidSdkApiLevel;
  final bool isAndroid11OrLater;
  final bool isAndroid13OrLater;

  const AndroidInfo({
    required this.androidSdkApiLevel,
    required this.isAndroid11OrLater,
    required this.isAndroid13OrLater,
  });
}
