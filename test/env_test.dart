import 'package:screenshots/config.dart';
import 'package:screenshots/screens.dart';
import 'package:test/test.dart';

void main() {
  test('store and retrieve environment', () async {
    final Config config = Config('test/test_config.yaml');
    final screens = await Screens();
    await screens.init();

    final env = {
      'screen_size': '1440x2560',
      'locale': 'en-US',
      'device_name': 'Nexus 6P',
      'device_type': 'android',
    };

    // called by screenshots before test
    config.storeEnv(
        config, screens, env['device_name'], env['locale'], env['device_type']);

    // called by test
    final Config testConfig = Config('test/test_config.yaml');
    await testConfig.retrieveEnv();

    expect(testConfig.screenshotsEnv, env);
  });
}
