<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

An implementation for the [“Arduino map”](https://www.arduino.cc/reference/en/language/functions/math/map/) function in Dart, which allows numbers to be remapped from one range to another.

## Features

**`remap` method:**

Re-maps a number from one range to another. That is, a value of `fromLow` would
get mapped to `toLow`, a value of `fromHigh` to `toHigh`, values in-between to values
in-between, etc.

Does not constrain values to within the range, because out-of-range values are
sometimes intended and useful. Use the `remapAndClamp` method if you wish for
the values to be constrained.

Note that the “lower bounds” of either range may be larger or smaller than the
“upper bounds” so the `remap()` method may be used to reverse a range of numbers,
for example
```dart
final reversedX = x.remap(1, 50, 50, 1);
```

The method also handles negative numbers well, so that this example
```dart
final y = x.remap(1, 50, 50, -100);
```
is also valid and works well.

<br>

**`remapAndClamp` method:**

Same as `remap`, however the result is being constrained to the range
`toLow`-`toHigh`.

For instance, the following code returns `1`:
```dart
150.remapAndClamp(0, 100, 0, 1)
```

Note that `toLow` may be greater than `toHigh`, so the following code
```dart
final y = x.remapAndClamp(0, 100, 100, 0);
```
works.

<br>

**Integer-only methods:**

Both the `remap` and the `remapAndClamp` offer integer-only versions of themselves (named `remapInt` nad `remapAndClampInt` respectively). These work the same as their `num` counterparts, however their return value is guaranteed to be an integer.

<br>

**`isWithinRange` method:**

Returns whether a number is within a given range.

<br>

## Getting started

1. Add the package as a dependency to your `pubspec.yaml`.
2. Import the library:

```dart
import 'package:num_remap/num_remap.dart';
```

<br>

## Usage

The library acts as an extension to the `num` and `int` types. You can use its methods as follows:

```dart
import 'package:num_remap/num_remap.dart';

...

final someDouble = 0.5;
final remappedDouble = someDouble.remap(0.0, 1.0, -100.0, 100.0);
```
