import 'package:flutter_test/flutter_test.dart';

import 'package:test_variant/test_variant.dart';

void main() {
  final variant = ValueVariant({1, 2, 3, 4, 5});
  testVariant('adds one to input values', () {
    print(variant.currentValue);
  }, variant: variant);
}
