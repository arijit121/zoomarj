import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zoom_arj/zoom_arj_method_channel.dart';

void main() {
  MethodChannelZoomArj platform = MethodChannelZoomArj();
  const MethodChannel channel = MethodChannel('zoom_arj');

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
