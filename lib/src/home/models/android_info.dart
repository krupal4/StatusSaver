class AndroidInfo {
  final int androidSdkApiLevel;
  final bool isAndroid11OrLater;
  final bool isAndroid13OrLater;
  final bool isAndroid10OrBefore;

  const AndroidInfo({
    required this.androidSdkApiLevel,
    required this.isAndroid11OrLater,
    required this.isAndroid13OrLater,
    required this.isAndroid10OrBefore,
  });
}
