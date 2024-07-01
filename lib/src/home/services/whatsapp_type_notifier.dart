import 'dart:async';
import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:status_saver/src/home/models/whatsapp_type_enum.dart';

class WhatsAppTypeNotifier extends AsyncNotifier<WhatsAppType?> {
  @override
  FutureOr<WhatsAppType?> build() async {
    final Map<WhatsAppType, String> packagesMap = {
      WhatsAppType.whatsApp: "com.whatsapp",
      WhatsAppType.w4b: "com.whatsapp.w4b"
    };
    for (MapEntry<WhatsAppType, String> packageMap in packagesMap.entries) {
      if (Platform.isAndroid) {
        final app = await _checkAppAvailability(packageMap.value);
        if (app != null) {
          return packageMap.key;
        }
      }
    }
    return null;
  }

  Future<AppInfo?> _checkAppAvailability(String package) async {
    try {
      final app = await AppCheck.checkAvailability(package);
      return app;
    } on PlatformException catch (e) {
      if (e.code == '400' && e.message?.contains('App not found') == true) {
        debugPrint('App not found for package $package');
        // Handle the app not being found (e.g., show a user message or handle gracefully)
      } else {
        debugPrint('PlatformException: ${e.message}');
        // Handle other platform exceptions
      }
    } catch (error) {
      debugPrint(
          'General error checking availability for package $package: $error');
      // Handle other general exceptions
    }
    return null;
  }
}

final whatsAppTypeProvider =
    AsyncNotifierProvider<WhatsAppTypeNotifier, WhatsAppType?>(
        WhatsAppTypeNotifier.new);
