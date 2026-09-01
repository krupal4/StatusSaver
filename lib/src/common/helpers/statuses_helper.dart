import 'package:status_saver/src/common/constants/directory_paths.dart';

// List<String> getDirectoryPaths(TabType tabType) {
//   return tabType == TabType.recent
//     ? recentDirectoryPaths
//     : const [savedStatusesDirectory];
// }

String getSavedStatusPath(String statusPath) =>
    "$savedStatusesDirectory/${statusPath.split('/').last}";

bool isItSavedStatus(statusPath) =>
    getSavedStatusPath(statusPath).compareTo(statusPath) == 0;

bool isImageStatus(String path) {
  final String lower = path.toLowerCase();
  return lower.endsWith('.jpg') ||
      lower.endsWith('.jpeg') ||
      lower.endsWith('.png');
}

bool isVideoStatus(String path) => path.toLowerCase().endsWith('.mp4');

// String getThumbnailPath(String videoPath) {
//   return "$thumbnailsDirectoryPath/${videoPath.split("/").last.replaceAll(mp4, png)}";
// }