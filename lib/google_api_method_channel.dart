import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'google_api_platform_interface.dart';

/// An implementation of [GoogleApiPlatform] that uses method channels.
class MethodChannelGoogleApi extends GoogleApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('google_api');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
