import 'dart:math';

import 'package:num_remap/num_remap.dart';
import 'package:test/test.dart';

void main() {
  test('remapInt and remapAndClampInt manual test', () async {
    expect(5.remapInt(0, 10, 0, 100), 50);
    expect(15.remapInt(0, 10, 0, 100), 150);
    expect(15.remapAndClampInt(0, 10, 0, 100), 100);
    expect(15.remapAndClampInt(0, 10, 100, 0), 0);
  });

  test('remapInt loop test', () async {
    for (int i = 0; i <= 100; i += 1) {
      for (int j = 1; j <= 100; j += 1) {
        for (int k = 1; k <= 100; k += 1) {
          expect(i.remapInt(0, j, 0, k), i * k ~/ j);
        }
      }
    }
  });

  test('remapInt fuzzy test', () async {
    const epsilon = 1;
    final random = Random(197376941);

    for (int i = 0; i < 100000000; i += 1) {
      final x = random.nextInt(4096);
      final fromLow = random.nextInt(4096);
      final fromHigh = random.nextInt(4096);
      final toLow = random.nextInt(4096);
      final toHigh = random.nextInt(4096);

      if (fromLow == fromHigh) continue;
      if (toLow == toHigh) continue;

      final remapped = x.remapInt(fromLow, fromHigh, toLow, toHigh);

      final ratioBefore = (x - fromLow) / (fromHigh - fromLow);
      final ratioAfter = (remapped - toLow) / (toHigh - toLow);

      expect(ratioAfter, closeTo(ratioBefore, epsilon));
    }
  });
}
