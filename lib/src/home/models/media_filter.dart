enum MediaFilter {
  all,
  photos,
  videos,
}

extension MediaFilterX on MediaFilter {
  bool matches(String path) {
    final String lower = path.toLowerCase();
    switch (this) {
      case MediaFilter.all:
        return true;
      case MediaFilter.photos:
        return lower.endsWith('.jpg') ||
            lower.endsWith('.jpeg') ||
            lower.endsWith('.png');
      case MediaFilter.videos:
        return lower.endsWith('.mp4');
    }
  }
}
