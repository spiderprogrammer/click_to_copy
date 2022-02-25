import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:click_to_copy/click_to_copy.dart';

void main() {
  const MethodChannel channel = MethodChannel('click_to_copy');

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
    expect(await ClickToCopy.platformVersion, '42');
  });
}
