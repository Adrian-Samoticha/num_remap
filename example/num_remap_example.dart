import 'package:num_remap/num_remap.dart';

void printSeparator() {
  print('-' * 16);
}

void main() {
  // basic usage
  print(50.remap(0, 100, 100, 200)); // prints '150.0'
  print(150.remap(100, 200, 0.0, 1.0)); // prints '0.5'
  
  printSeparator();
  
  // remap and clamp
  print(150.remap(0, 100, 0, 1)); // prints '1.5'
  print(150.remapAndClamp(0, 100, 0, 1)); // prints '1' since the value is clamped to be in the range 0-1
  
  printSeparator();
  
  // the “lower bound” may also be greater than the “upper bound”
  print(150.remapAndClamp(0, 100, 1, 0)); // prints '0' since the value is clamped to be in the range 1-0
  print(150.remapAndClamp(100, 0, 1, 0)); // prints '1' since the value is clamped to be in the range 1-0
  
  printSeparator();
  
  // both methods also exist as integer-only versions
  print(75.remapInt(0, 100, 0, 10)); // prints '7' since the return value is an integer
  print(115.remapAndClampInt(0, 100, 0, 10)); // prints '10' since the value is clamped to be in the range 0-10
}
