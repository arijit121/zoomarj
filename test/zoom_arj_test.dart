import 'package:flutter_test/flutter_test.dart';
import 'package:zoom_arj/zoom_arj.dart';
import 'package:zoom_arj/zoom_arj_platform_interface.dart';
import 'package:zoom_arj/zoom_arj_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZoomArjPlatform
    with MockPlatformInterfaceMixin
    implements ZoomArjPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZoomArjPlatform initialPlatform = ZoomArjPlatform.instance;

  test('$MethodChannelZoomArj is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZoomArj>());
  });

  test('getPlatformVersion', () async {
    ZoomArj zoomArjPlugin = ZoomArj();
    MockZoomArjPlatform fakePlatform = MockZoomArjPlatform();
    ZoomArjPlatform.instance = fakePlatform;

    expect(await zoomArjPlugin.getPlatformVersion(), '42');
  });
}
