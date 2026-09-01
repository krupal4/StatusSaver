import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/home/models/media_filter.dart';

class MediaFilterNotifier extends Notifier<MediaFilter> {
  @override
  MediaFilter build() => MediaFilter.all;

  void set(MediaFilter filter) {
    state = filter;
  }
}

final mediaFilterProvider =
    NotifierProvider<MediaFilterNotifier, MediaFilter>(MediaFilterNotifier.new);
