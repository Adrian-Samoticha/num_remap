import 'dart:math';

import 'package:test/test.dart';
import 'package:num_remap/num_remap.dart';

void main() {
  test('remap and remapAndClamp manual test', () async {
    expect(5.remap(0, 10, 0, 100), 50.0);
    expect(15.remap(0, 10, 0, 100), 150.0);
    expect(15.remapAndClamp(0, 10, 0, 100), 100.0);
    expect(15.remapAndClamp(0, 10, 100, 0), 0.0);
  });
  
  test('remap loop test', () async {
    for (int i = 0; i <= 100; i += 1) {
      for (int j = 1; j <= 100; j += 1) {
        for (int k = 1; k <= 100; k += 1) {
          expect(i.remap(0, j, 0, k), i * k / j);
        }
      }
    }
  });
  
  test('remap fuzzy test', () async {
    const epsilon = 1e-8;
    final random = Random(197376941);
    
    for (int i = 0; i < 100000000; i += 1) {
      final x = random.nextDouble();
      final fromLow = random.nextDouble();
      final fromHigh = random.nextDouble();
      final toLow = random.nextDouble();
      final toHigh = random.nextDouble();
      
      final remapped = x.remap(fromLow, fromHigh, toLow, toHigh);
      
      final ratioBefore = (x - fromLow) / (fromHigh - fromLow);
      final ratioAfter = (remapped - toLow) / (toHigh - toLow);
      
      expect(ratioAfter, closeTo(ratioBefore, epsilon));
    }
  });
  
  test('isWithinRange manual test', () async {
    expect(5.isWithinRange(0, 10), true);
    expect(11.isWithinRange(0, 10), false);
    expect((-1).isWithinRange(0, 10), false);
    expect(0.isWithinRange(0, 10), true);
    expect(10.isWithinRange(0, 10), true);
    
    expect(5.0.isWithinRange(0.0, 10.0), true);
    expect(11.0.isWithinRange(0.0, 10.0), false);
    expect((-1.0).isWithinRange(0.0, 10.0), false);
    expect(10.0.isWithinRange(0.0, 10.0), true);
  });
  
  test('remapAndClamp fuzzy test', () async {
    final random = Random(197376941);
    
    for (int i = 0; i < 100000000; i += 1) {
      final x = random.nextDouble();
      final fromLow = random.nextDouble();
      final fromHigh = random.nextDouble();
      final toLow = random.nextDouble();
      final toHigh = random.nextDouble();
      
      final remapped = x.remapAndClamp(fromLow, fromHigh, toLow, toHigh);
      
      expect(remapped.isWithinRange(toLow, toHigh), true);
    }
  });
}