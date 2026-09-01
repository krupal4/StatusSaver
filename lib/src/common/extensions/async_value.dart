import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/views/common_error_screen.dart';
import 'package:status_saver/src/common/views/shimmer_grid.dart';

extension WhenAsyncValue<T> on AsyncValue<T> {
  Widget whenWidget(
    Widget Function(T) data, {
    VoidCallback? onRetry,
    Widget Function()? loading,
  }) =>
      when(
        data: data,
        error: (error, stackTrace) => AppErrorScreen(onRetry: onRetry),
        loading: loading ?? ShimmerGrid.new,
      );
}
