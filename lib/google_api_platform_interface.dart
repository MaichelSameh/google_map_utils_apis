import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'google_api_method_channel.dart';

abstract class GoogleApiPlatform extends PlatformInterface {
  /// Constructs a GoogleApiPlatform.
  GoogleApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static GoogleApiPlatform _instance = MethodChannelGoogleApi();

  /// The default instance of [GoogleApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelGoogleApi].
  static GoogleApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GoogleApiPlatform] when
  /// they register themselves.
  static set instance(GoogleApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
