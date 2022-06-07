library test_variant;

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meta/meta.dart';

@isTest
void testVariant(
  String description,
  VoidCallback callback, {
  TestVariant<Object?> variant = const DefaultTestVariant(),
}) {
  assert(variant.values.isNotEmpty,
      'There must be at least one value to test in the testing variant.');

  for (final dynamic value in variant.values) {
    final variationDescription = variant.describeValue(value);
    final combinedDescription = variationDescription.isNotEmpty
        ? '$description (variant: $variationDescription)'
        : description;
    test(
      combinedDescription,
      () async {
        Object? memento;
        try {
          memento = await variant.setUp(value);
          callback();
        } finally {
          await variant.tearDown(value, memento);
        }
      },
    );
  }
}
