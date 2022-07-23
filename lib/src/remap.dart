extension Remap on num {
  /// Re-maps a number from one range to another. That is, a value of [fromLow] would
  /// get mapped to [toLow], a value of [fromHigh] to [toHigh], values in-between to values
  /// in-between, etc.
  /// 
  /// Does not constrain values to within the range, because out-of-range values are
  /// sometimes intended and useful. Use the [remapAndClamp] method if you wish for
  /// the values to be constrained.
  /// 
  /// Note that the “lower bounds” of either range may be larger or smaller than the
  /// “upper bounds” so the `remap()` method may be used to reverse a range of numbers,
  /// for example
  /// ```
  /// final reversedX = x.remap(1, 50, 50, 1);
  /// ```
  /// 
  /// The method also handles negative numbers well, so that this example
  /// ```
  /// final y = x.remap(1, 50, 50, -100);
  /// ```
  /// is also valid and works well.
  double remap(num fromLow, num fromHigh, num toLow, num toHigh) {
    return (this - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow;
  }
  
  /// Same as [remap], however the result is being constrained to the range
  /// [toLow]-[toHigh].
  /// 
  /// For instance, the following code returns `1`:
  /// ```
  /// 150.remapAndClamp(0, 100, 0, 1)
  /// ```
  /// 
  /// Note that [toLow] may be greater than [toHigh], so the following code
  /// ```
  /// final y = x.remapAndClamp(0, 100, 100, 0);
  /// ```
  /// works.
  num remapAndClamp(num fromLow, num fromHigh, num toLow, num toHigh) {
    final remappedValue = remap(fromLow, fromHigh, toLow, toHigh);
    
    if (toLow > toHigh) {
      return remappedValue.clamp(toHigh, toLow);
    }
    
    return remappedValue.clamp(toLow, toHigh);
  }
  
  /// Returns whether a number is within a given range.
  bool isWithinRange(num from, num to) {
    return (this >= from && this <= to) || (this <= from && this >= to);
  }
}
