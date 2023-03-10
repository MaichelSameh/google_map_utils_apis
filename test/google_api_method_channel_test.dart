import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_api/google_api_method_channel.dart';

void main() {
  MethodChannelGoogleApi platform = MethodChannelGoogleApi();
  const MethodChannel channel = MethodChannel('google_api');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
