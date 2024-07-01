import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/common/views/circular_loader.dart';
import 'package:status_saver/src/common/views/common_error_screen.dart';

extension WhenAsyncValue<T> on AsyncValue<T> {
  Widget whenWidget(Widget Function(T) data) => when(
        data: data,
        error: commonErrorScreen,
        loading: CircularLoader.new,
      );
}
