## Features

This package will add some features to help on yours tests

## Usage

```dart
void main() {
  final variant = ValueVariant({1, 2, 3, 4, 5});
  testVariant('adds one to input values', () {
    print(variant.currentValue);
  }, variant: variant);
}
```
