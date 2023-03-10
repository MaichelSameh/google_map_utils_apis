import 'package:flutter_test/flutter_test.dart';
import 'package:google_api/google_api.dart';
import 'package:google_api/google_api_platform_interface.dart';
import 'package:google_api/google_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGoogleApiPlatform
    with MockPlatformInterfaceMixin
    implements GoogleApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GoogleApiPlatform initialPlatform = GoogleApiPlatform.instance;

  test('$MethodChannelGoogleApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGoogleApi>());
  });

  test('getPlatformVersion', () async {
    GoogleApi googleApiPlugin = GoogleApi();
    MockGoogleApiPlatform fakePlatform = MockGoogleApiPlatform();
    GoogleApiPlatform.instance = fakePlatform;

    expect(await googleApiPlugin.getPlatformVersion(), '42');
  });
}
