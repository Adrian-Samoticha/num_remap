extension RemapInt on int {
  /// Same as [remap], but using integer arithmetic only.
  int remapInt(int fromLow, int fromHigh, int toLow, int toHigh) {
    return (this - fromLow) * (toHigh - toLow) ~/ (fromHigh - fromLow) + toLow;
  }

  /// Same as [remapAndClamp], but using integer arithmetic only.
  int remapAndClampInt(int fromLow, int fromHigh, int toLow, int toHigh) {
    final remappedValue = remapInt(fromLow, fromHigh, toLow, toHigh);

    if (toLow > toHigh) {
      return remappedValue.clamp(toHigh, toLow);
    }

    return remappedValue.clamp(toLow, toHigh);
  }
}
