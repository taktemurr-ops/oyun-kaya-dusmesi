import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kaya_dusmesi/oyun_kaya_dusmesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kayaConfig.title.length, 33);
    expect(kayaConfig.tagline.length, 33);
    for (final s in kayaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kayaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kayaId, optionalMechanics: kayaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kayaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
